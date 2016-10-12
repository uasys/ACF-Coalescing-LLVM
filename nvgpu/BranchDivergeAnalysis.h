
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"

#include "ThreadDepAnalysis.h"
#include "ThreadValueAnalysis.h"

#ifndef BRANCH_DIVERGE_H
#define BRANCH_DIVERGE_H

namespace gpucheck {

  class BranchDivergeAnalysis : public FunctionPass {
    public:
      static char ID;
      BranchDivergeAnalysis() : FunctionPass(ID) {}
      void getAnalysisUsage(AnalysisUsage &AU) const {
        AU.setPreservesAll();
        AU.addRequired<ThreadDependence>();
        AU.addRequired<ThreadValueAnalysis>();
      }
      bool runOnFunction(Function &F);
      float getDivergence(BranchInst *BI);
    private:
      ThreadDependence *TD;
      ThreadValueAnalysis *TV;
  };

}

#endif
