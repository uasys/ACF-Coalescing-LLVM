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

using namespace std;
using namespace llvm;
using namespace gpucheck;

#define DEBUG_TYPE "coalesce"

#define COALESCE_THRES 4.0f

bool MemCoalesceAnalysis::runOnModule(Module &M) {
  // Run over each kernel function
  for(auto f=M.begin(), e=M.end(); f!=e; ++f) {
    if(isKernelFunction(*f))
      runOnKernel(*f);
  }
  return false;
}

bool MemCoalesceAnalysis::runOnKernel(Function &F) {
  // Get the analyses for this kernel
  TD = &getAnalysis<ThreadDependence>(F);
  TV = &getAnalysis<ThreadValueAnalysis>(F);

  for(auto f=F.getParent()->begin(),e=F.getParent()->end(); f!=e; ++f) {
    for(auto b=f->begin(),e=f->end(); b!=e; ++b) {
      for(auto i=b->begin(),e=b->end(); i!=e; ++i) {
        if(TD->isDependent(&*i)) {
          Value *ptr = nullptr;
          if(auto L=dyn_cast<LoadInst>(i)) {
            ptr = L->getOperand(L->getPointerOperandIndex());
          }
          if(auto S=dyn_cast<StoreInst>(i)) {
            ptr = S->getOperand(S->getPointerOperandIndex());
          }
          if(ptr != nullptr) {
            // We have a memory access to inspect
            float requests = requestsPerWarp(ptr);
            if(requests > COALESCE_THRES)
              emitWarning("Uncoalesced Access Detected", &*i);

            DEBUG(errs() << "Found a memory access:\n");
            DEBUG(i->dump());
            DEBUG(errs() << "\n Memory requests required per warp: " <<
                requestsPerWarp(ptr) << "\n");
          }
        }
      }
    }
  }
  return false;
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
    DEBUG(errs() << "Requests in warp " << warp << "\n");
    DEBUG(for(auto r=requests.begin(),e=requests.end();r!=e;++r) {
      errs() << "    " << r->first << " - " << r->second << "\n";
    });
    requestCount += requests.size();
  }
  return requestCount / 32.0f;
}

char MemCoalesceAnalysis::ID = 0;
static RegisterPass<MemCoalesceAnalysis> X("coalesce", "Locate uncoalesced memory accesses in GPU code",
                                        false,
                                        true);
