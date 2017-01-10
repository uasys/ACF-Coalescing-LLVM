#include "OffsetVal.h"
#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Dominators.h"
#include <unordered_map>
#include <vector>

#ifndef OFFSET_PROP_H
#define OFFSET_PROP_H

using namespace llvm;

namespace gpucheck {
  class OffsetPropagation : public ModulePass {
    private:
      Module *M;
      std::unordered_map<Value *, OffsetVal> offsets;
      std::vector<OffsetVal> virtuals;

      const OffsetVal& getOrCreateVal(Value *);

      const OffsetVal& getOrCreateVal(BinaryOperator *);
      const OffsetVal& getOrCreateVal(CallInst *);
      const OffsetVal& getOrCreateVal(CastInst *);
      const OffsetVal& getOrCreateVal(CmpInst *);
      const OffsetVal& getOrCreateVal(Constant *);
      const OffsetVal& getOrCreateVal(LoadInst *);
      const OffsetVal& getOrCreateVal(PHINode *);

      OffsetOperator fromBinaryOpcode(llvm::Instruction::BinaryOps);
      OffsetOperator fromCmpPredicate(llvm::CmpInst::Predicate);

      const OffsetVal& applyDominatingCondition(std::vector<Value *>& values,
                                                std::vector<BasicBlock *>& blocks,
                                                DominatorTree& DT);

      const OffsetVal& negateCondition(const OffsetVal& cond);

      const OffsetVal& mkvirt(const OffsetVal& o);

    public:
      static char ID;
      OffsetPropagation() : ModulePass(ID) {}
      bool runOnModule(Module &F);
      void getAnalysisUsage(AnalysisUsage &AU) const;
  };
}

#endif
