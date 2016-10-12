#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Constants.h"

#include "ThreadDepAnalysis.h"
#include <map>

#ifndef THREAD_VAL_H
#define THREAD_VAL_H

namespace gpucheck {

  class ThreadValueAnalysis : public FunctionPass {
    public:
      static char ID;
      ThreadValueAnalysis() : FunctionPass(ID) {}
      void getAnalysisUsage(AnalysisUsage &AU) const {
        AU.setPreservesAll();
        AU.addRequired<ThreadDependence>();
      }
      bool runOnFunction(Function &F);
      APInt *evaluateForThreadIdx(Value *v, int threadID);
      APInt *threadDepPortion(Value *v, int threadID);
    private:
      DataLayout *DL;
      ThreadDependence *TD;
      const APInt* evaluateForThreadIdx(Value *v, APInt threadID, map<Value *, APInt>& knownValues);
      const APInt* threadDepPortion(Value *v, APInt threadID, map<Value *, APInt>& knownPortions, map<Value *, APInt>& knownValues, ThreadDependence* td);
  };

}

#endif
