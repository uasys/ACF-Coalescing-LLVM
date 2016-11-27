#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/IntrinsicInst.h"

#include "MemCoalesceAnalysis.h"
#include "BugEmitter.h"
#include "Utilities.h"

#include <vector>
#include <utility>
#include <string>
#include <iostream>

using namespace std;
using namespace llvm;
using namespace gpucheck;

#define DEBUG_TYPE "coalesce"

#define COALESCE_THRES 4.0f

bool MemCoalesceAnalysis::runOnModule(Module &M) {
  TD = &getAnalysis<ThreadDependence>();
  TV = &getAnalysis<ThreadValueAnalysis>();
  ASA = &getAnalysis<AddrSpaceAnalysis>();
  // Run over each GPU function
  for(auto f=M.begin(), e=M.end(); f!=e; ++f) {
    //if(isKernelFunction(*f))
      runOnKernel(*f);
  }
  return false;
}

bool MemCoalesceAnalysis::runOnKernel(Function &F) {

  for(auto b=F.begin(),e=F.end(); b!=e; ++b) {
    for(auto i=b->begin(),e=b->end(); i!=e; ++i) {
      if(TD->isDependent(&*i)) {

        if(auto L=dyn_cast<LoadInst>(i))
          testLoad(L);

        if(auto S=dyn_cast<StoreInst>(i))
          testStore(S);

        if(auto CI=dyn_cast<CallInst>(i))
          testCall(CI);
      }
    }
  }
  return false;
}

void MemCoalesceAnalysis::testCall(CallInst *CI) {
  if(auto MC = dyn_cast<MemCpyInst>(CI))
    if(!testAccess(MC, MC->getDest()))
      testAccess(MC, MC->getSource());

  if(auto MM = dyn_cast<MemMoveInst>(CI))
    if(!testAccess(MM, MM->getDest()))
      testAccess(MM, MM->getSource());
}

void MemCoalesceAnalysis::testLoad(LoadInst *L) {
  testAccess(L, L->getPointerOperand());
}

void MemCoalesceAnalysis::testStore(StoreInst *S) {
  testAccess(S, S->getPointerOperand());
}

bool MemCoalesceAnalysis::testAccess(Instruction *i, Value *ptr) {
  DEBUG(errs() << "Found a memory access:\n");
  DEBUG(i->dump());
  DEBUG(errs() << "\n Memory requests required per warp: " <<
      requestsPerWarp(ptr) << "\n");

  // Ignore shared/constant memory accesses
  if(!ASA->mayBeGlobal(i))
    return false;
  MemAccess tpe = getAccessType(i, ptr);
  if(tpe == Update && isa<StoreInst>(i)) {
    // Don't report updates twice
    return false;
  }
  // We have a memory access to inspect
  float requests = requestsPerWarp(ptr);
  if(requests > COALESCE_THRES) {
    Severity sev;
    emitWarning(getWarning(&*ptr, tpe, requests, sev), &*i, sev);
    return true;
  }

  return false;
}

MemAccess MemCoalesceAnalysis::getAccessType(Instruction *i, Value *address) {
  bool read = false;
  bool written = false;
  bool memcpy = false;
  for(auto user=address->user_begin(),e=address->user_end(); user != e; ++user) {
    if(auto u=dyn_cast<Instruction>(*user)) {
      if(isa<LoadInst>(u) && u->getParent() == i->getParent())
        read = true;
      if(isa<StoreInst>(u) && u->getParent() == i->getParent())
        written = true;
      if(isa<CallInst>(u) && u->getParent() == i->getParent())
        memcpy = true;
    }
  }
  if(memcpy)
    return MemAccess::Copy;
  if(read && written)
    return MemAccess::Update;
  if(read)
    return MemAccess::Read;
  if(written)
    return MemAccess::Write;
  //TODO: error, should never reach here
  return MemAccess::Unknown;
}

string MemCoalesceAnalysis::getWarning(Value *ptr, MemAccess tpe, float requestsPerWarp, Severity& severity) {
  int reqs = (int) requestsPerWarp;
  string prefix = "";
  switch (tpe) {
    case Write:
      prefix = "In write to "+getValueName(ptr)+", ";
      break;
    case Read:
      prefix = "In read from "+getValueName(ptr)+", ";
      break;
    case Update:
      prefix = "In update to "+getValueName(ptr)+", ";
      break;
    case Copy:
      prefix = "In copy to "+getValueName(ptr)+", ";
      break;
  }

  APInt *val[1024];
  for(int i = 0; i<1024; i++)
    val[i] = TV->threadDepPortion(ptr, i);

  for(int i = 0; i<1024; i++)
    if(val[i] == nullptr) {
      DEBUG(errs() << "nullptr at thread " << i << "\n";);
      severity = Severity::SEV_UNKNOWN;
      return prefix + "Possible Uncoalesced Access Detected";
    }

  APInt stride = *val[1]-*val[0];
  bool strided = true;
  for(int i = 2; i<1024; i++) {
    if(*val[i]-*val[i-1] != stride)
      strided = false;
  }

  if(strided) {
    SmallString<16> strideStr;
    stride.toString(strideStr, 10, true);
    severity = Severity::SEV_MAX;
    return prefix + "Memory access stride " + string(strideStr.c_str()) + " exceeds max stride 4, requires " + to_string(reqs) + " requests";
  }

  // Let's set severity by how uncoalesced the access is
  if(reqs > 16) {
    severity = Severity::SEV_MAX;
  } else if(reqs > 8) {
    severity = Severity::SEV_MED;
  } else {
    severity = Severity::SEV_MIN;
  }
  return prefix + "Uncoalesced Memory Access requires " + to_string(reqs) + " requests/warp";
}

float MemCoalesceAnalysis::requestsPerWarp(Value *ptr) {
  int requestCount = 0;
  for(int warp = 0; warp<32; warp++) {
    vector<pair<APInt,APInt>> requests;
    for(int tid=0; tid<32; tid++) {
      APInt *val = TV->threadDepPortion(ptr, warp*32+tid);

      if(val == nullptr) {
        requestCount++;
        continue;
      }

      // Try to fit it into existing requests
      bool fits = false;
      for(auto r=requests.begin(),e=requests.end();r!=e;++r) {
        if(val->sge(r->first) && val->sle(r->second - 4)) {
          // Fits inside existing request
          fits = true;
          break;
        } else if(val->sge(r->first - 4) && val->sle(r->second - 4)) {
          // Fits against lower edge
          fits = true;
          r->first = *val;
        } else if(val->sge(r->first) && val->sle(r->second)) {
          // Fits against upper edge
          fits = true;
          r->second = *val+4;
        }
      }

      // Otherwise create a new request
      if(!fits) {
        requests.push_back(make_pair(*val,*val+4));
      }
    }
    // Attempt to merge requests
    for(int i=0; i<requests.size();) {
      bool combined = false;
      for(int cmp=i+1; cmp<requests.size(); cmp++) {
        if((requests[cmp].first.sle(requests[i].first) &&
            requests[cmp].second.sge(requests[i].first)) ||
           (requests[cmp].second.sge(requests[i].second) &&
            requests[cmp].first.sle(requests[i].second))) {
          // These requests definitely overlap, combine them
          if (requests[cmp].first.slt(requests[i].first))
            requests[i].first = requests[cmp].first;
          if (requests[cmp].second.sgt(requests[i].second))
            requests[i].second = requests[cmp].second;
          // remove the second request
          requests.erase(requests.begin()+cmp);
          combined = true;
        }
      }
      // Only move on if we didn't coalesce
      if(!combined)
        i++;
    }
    DEBUG(if(warp == 0) {
      errs() << "Requests for address:\n";
      ptr->dump();
      errs() << "Known Requests: " << requests.size() << " \n";
      for(auto r=requests.begin(),e=requests.end(); r!=e; ++r)
        errs() << r->first << "-" << r->second << "\n";
      errs() << "Unknown Requests: " << requestCount << "\n";
    });
    requestCount += requests.size();
  }
  return requestCount / 32.0f;
}

char MemCoalesceAnalysis::ID = 0;
static RegisterPass<MemCoalesceAnalysis> X("coalesce", "Locate uncoalesced memory accesses in GPU code",
                                        false,
                                        true);
