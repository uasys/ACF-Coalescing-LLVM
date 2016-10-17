#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"

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
        Value *ptr = nullptr;
        bool write = false;
        if(auto L=dyn_cast<LoadInst>(i)) {
          ptr = L->getOperand(L->getPointerOperandIndex());
        }
        if(auto S=dyn_cast<StoreInst>(i)) {
          write = true;
          ptr = S->getOperand(S->getPointerOperandIndex());
        }
        if(ptr != nullptr) {
          // We have a memory access to inspect
          float requests = requestsPerWarp(ptr);
          if(requests > COALESCE_THRES) {
            Severity sev;
            emitWarning(getWarning(&*ptr, write, requests, sev), &*i, sev);
          }

          DEBUG(errs() << "Found a memory access:\n");
          DEBUG(i->dump());
          DEBUG(errs() << "\n Memory requests required per warp: " <<
              requestsPerWarp(ptr) << "\n");
        }
      }
    }
  }
  return false;
}

string MemCoalesceAnalysis::getWarning(Value *ptr, bool write, float requestsPerWarp, Severity& severity) {
  int reqs = (int) requestsPerWarp;
  string prefix = "";
  if (write)
    prefix = "In write to "+getValueName(ptr)+", ";
  else
    prefix = "In read from "+getValueName(ptr)+", ";

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
    vector<pair<size_t,size_t>> requests;
    for(int tid=0; tid<32; tid++) {
      APInt *val = TV->threadDepPortion(ptr, warp*32+tid);

      if(val == nullptr) {
        requestCount++;
        continue;
      }

      // Get the offset as an integer
      size_t offset = val->getRawData()[0];

      // Try to fit it into existing requests
      bool fits = false;
      for(auto r=requests.begin(),e=requests.end();r!=e;++r) {
        if(offset >= r->first && offset <= r->second - 4) {
          // Fits inside existing request
          fits = true;
          break;
        } else if(offset >= r->first - 4 && offset <= r->second - 4) {
          // Fits against lower edge
          fits = true;
          r->first = offset;
        } else if(offset >= r->first && offset <= r->second) {
          // Fits against upper edge
          fits = true;
          r->second = offset+4;
        }
      }

      // Otherwise create a new request
      if(!fits) {
        requests.push_back(make_pair(offset,offset+4));
      }
    }
    // Attempt to merge requests
    for(int i=0; i<requests.size();) {
      bool combined = false;
      for(int cmp=i+1; cmp<requests.size(); cmp++) {
        if((requests[cmp].first <= requests[i].first && requests[cmp].second >= requests[i].first) ||
           (requests[cmp].second >= requests[i].second && requests[cmp].first <= requests[i].second)) {
          // These requests definitely overlap, combine them
          if (requests[cmp].first < requests[i].first)
            requests[i].first = requests[cmp].first;
          if (requests[cmp].second > requests[i].second)
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
    requestCount += requests.size();
  }
  return requestCount / 32.0f;
}

char MemCoalesceAnalysis::ID = 0;
static RegisterPass<MemCoalesceAnalysis> X("coalesce", "Locate uncoalesced memory accesses in GPU code",
                                        false,
                                        true);
