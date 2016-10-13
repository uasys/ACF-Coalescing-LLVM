#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"

#include "BranchDivergeAnalysis.h"
#include "BugEmitter.h"
#include "Utilities.h"

using namespace std;
using namespace llvm;
using namespace gpucheck;

#define DEBUG_TYPE "bdiverge"

#define DIVERGE_THRESH 0.2f

bool BranchDivergeAnalysis::runOnModule(Module &M) {
  // Run over each kernel function
  for(auto f=M.begin(), e=M.end(); f!=e; ++f) {
    if(isKernelFunction(*f))
      runOnKernel(*f);
  }
  return false;
}

bool BranchDivergeAnalysis::runOnKernel(Function &F) {
  // Get the analyses for this kernel
  TD = &getAnalysis<ThreadDependence>(F);
  TV = &getAnalysis<ThreadValueAnalysis>(F);

  for(auto f=F.getParent()->begin(),e=F.getParent()->end(); f!=e; ++f) {
    for(auto b=f->begin(),e=f->end(); b!=e; ++b) {
      for(auto i=b->begin(),e=b->end(); i!=e; ++i) {
        if(auto B=dyn_cast<BranchInst>(i)) {
          if(B->isConditional() && TD->isDependent(B)) {
            // We've found a potentially divergent branch!
            // TODO: Determine if branch is high-cost
            float divergence = getDivergence(B);
            if(divergence > DIVERGE_THRESH) {
              emitWarning("Divergent Branch Detected", B);
              DEBUG(
                errs() << "Found Divergent Branch!! diverge=(" << divergence << ")\n";
                B->dump();
                errs() << "\n\n";
              );
            } else {
              DEBUG(
                errs() << "Nondivergent branch, diverge=(" << divergence << ")\n";
                B->dump();
                errs() << "\n\n";
              );
            }
          }
        }
      }
    }
  }
  return false;
}

float BranchDivergeAnalysis::getDivergence(BranchInst *BI) {
  assert(BI->isConditional());
  int divergent = 0;
  for(int warp=0; warp<32; warp++) {
    APInt *out = TV->evaluateForThreadIdx(BI->getCondition(), warp*32);
    if(out == nullptr) {
      divergent++;
      continue;
    }
    for(int tid=1; tid<32; tid++) {
      APInt *next = TV->evaluateForThreadIdx(BI->getCondition(), warp*32+tid);
      if(next == nullptr) {
        divergent++;
        break;
      }
      if(!next->eq(*out)) {
        divergent++;
        delete next;
        break;
      }
    }
    delete out;
  }
  return divergent/32.0f;
}

char BranchDivergeAnalysis::ID = 0;
static RegisterPass<BranchDivergeAnalysis> X("bdiverge", "Locate divergent branches in GPU code",
                                        false,
                                        true);

#undef DEBUG_TYPE
