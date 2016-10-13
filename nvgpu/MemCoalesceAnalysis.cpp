#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"

#include "MemCoalesceAnalysis.h"
#include "Utilities.h"

using namespace std;
using namespace llvm;
using namespace gpucheck;

#define DEBUG_TYPE "coalesce"

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
            ptr = L->getOperand(0);
          }
          if(auto S=dyn_cast<StoreInst>(i)) {
            ptr = S->getOperand(0);
          }
          if(ptr != nullptr) {
            // We have a memory access to inspect

          }
        }
      }
    }
  }
  return false;
}

int MemCoalesceAnalysis::coalescedRequests(Value *ptr) {
  // TODO: Implement coalescing logic over the thread-dependent portions of an access
  return 1;
}

char MemCoalesceAnalysis::ID = 0;
static RegisterPass<MemCoalesceAnalysis> X("coalesce", "Locate uncoalesced memory accesses in GPU code",
                                        false,
                                        true);
