#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"

#include "ThreadDepAnalysis.h"
#include <map>

#ifndef THREAD_VAL_H
#define THREAD_VAL_H

namespace gpucheck {

  class ThreadValueAnalysis : public ModulePass {
    public:
      static char ID;
      ThreadValueAnalysis() : ModulePass(ID) {}
      void getAnalysisUsage(AnalysisUsage &AU) const {
        AU.setPreservesAll();
        AU.addRequired<ThreadDependence>();
        AU.addRequired<DominatorTreeWrapperPass>();
      }
      bool runOnModule(Module &M);
      APInt *evaluateForThreadIdx(Value *v, int threadID);
      APInt *threadDepPortion(Value *v, int threadID);
    private:
      DataLayout *DL;
      ThreadDependence *TD;

      // Initialization Methods
      void pushdownArgs(Function *F, map<Function *,bool>& visited);

      // Helper methods
      Value* PHISelectEdge(PHINode *PHI, APInt threadID, map<Value *, APInt>& knownValues);
      Value* CallSelectEdge(CallInst *CI, APInt threadID, map<Value *, APInt>& knownValues);

      // Exact Value evaluation
      const APInt* evaluateForThreadIdx(Value *v, APInt threadID, map<Value *, APInt>& knownValues);
      const APInt* evaluateBinaryOp(BinaryOperator *BO, APInt threadID, map<Value *, APInt>& knownValues);
      const APInt* evaluateCall(CallInst *CI, APInt threadID, map<Value *, APInt>& knownValues);
      const APInt* evaluateCmp(CmpInst *CI, APInt threadID, map<Value *, APInt>& knownValues);
      const APInt* evaluatePHI(PHINode *PHI, APInt threadID, map<Value *, APInt>& knownValues);
      const APInt* evaluateLoad(LoadInst *L, APInt threadID, map<Value *, APInt>& knownValues);

      // Thread-dependent portion evaluation
      const APInt* threadDepPortion(Value *v, APInt threadID, map<Value *, APInt>& knownPortions, map<Value *, APInt>& knownValues, ThreadDependence* td);

      const APInt* threadDepPHI(PHINode *PHI, APInt threadID, map<Value *, APInt>& knownPortions, map<Value *, APInt>& knownValues, ThreadDependence* td);

      const APInt* threadDepCall(CallInst *CI, APInt threadID, map<Value *, APInt>& knownPortions, map<Value *, APInt>& knownValues, ThreadDependence* td);

      const APInt* threadDepBinaryOp(BinaryOperator *BO, APInt threadID, map<Value *, APInt>& knownPortions, map<Value *, APInt>& knownValues, ThreadDependence* td);

      const APInt* threadDepGEP(GetElementPtrInst *GEP, APInt threadID, map<Value *, APInt>& knownPortions, map<Value *, APInt>& knownValues, ThreadDependence* td);

      const APInt* threadDepLoad(LoadInst *L, APInt threadID, map<Value *, APInt>& knownPortions, map<Value *, APInt>& knownValues, ThreadDependence* td);

      vector<map<Value *,APInt>> known;
      vector<map<Value *,APInt>> evalKnown;
  };

}

#endif
