#include "OffsetPropagation.h"
#include "llvm/Analysis/MemoryDependenceAnalysis.h"

namespace gpucheck {
  void OffsetPropagation::getAnalysisUsage(AnalysisUsage& AU) const {
    AU.setPreservesAll();
    AU.addRequired<MemoryDependenceAnalysis>();
    AU.addRequired<DominatorTreeWrapperPass>();
  }

  bool OffsetPropagation::runOnModule(Module &M) {
    // Save my owned module
    this->M = &M;
    // Empty any calculated results
    this->offsets.clear();
    this->virtuals.clear();

    // OffsetVals are evaluated lazily as required
    return false;
  }

  /**
   * Generic method for any value, used to dispatch to the others
   */
  const OffsetVal& OffsetPropagation::getOrCreateVal(Value *v) {
    if(auto b = dyn_cast<BinaryOperator>(v)) return getOrCreateVal(b);
    if(auto c = dyn_cast<CallInst>(v)) return getOrCreateVal(c);
    if(auto c = dyn_cast<CastInst>(v)) return getOrCreateVal(c);
    if(auto c = dyn_cast<CmpInst>(v)) return getOrCreateVal(c);
    if(auto c = dyn_cast<Constant>(v)) return getOrCreateVal(c);
    if(auto l = dyn_cast<LoadInst>(v)) return getOrCreateVal(l);
    if(auto p = dyn_cast<PHINode>(v)) return getOrCreateVal(p);

    // Fallthrough, unknown instruction
    assert(isa<Instruction>(v));
    offsets[v] = InstOffsetVal(dyn_cast<Instruction>(v));
    return offsets[v];
  }

  const OffsetVal& OffsetPropagation::getOrCreateVal(BinaryOperator *bo) {
    // Generate an operator as a function of the binary operator

    OffsetOperator op = fromBinaryOpcode(bo->getOpcode());
    if(op == OffsetOperator::end) {
      // We don't handle this kind of operation
      offsets[bo] = InstOffsetVal(bo);
      return offsets[bo];
    }

    const OffsetVal& lhs = getOrCreateVal(bo->getOperand(0));
    const OffsetVal& rhs = getOrCreateVal(bo->getOperand(1));
    offsets[bo] = BinOpOffsetVal(lhs, op, rhs);
    return offsets[bo];
  }

  const OffsetVal& OffsetPropagation::getOrCreateVal(CallInst *ci) {
    //TODO
    offsets[ci] = InstOffsetVal(ci);
    return offsets[ci];
  }

  const OffsetVal& OffsetPropagation::getOrCreateVal(CastInst *ci) {
    // Just drop through the cast for now
    return getOrCreateVal(ci->getOperand(0));
  }

  const OffsetVal& OffsetPropagation::getOrCreateVal(CmpInst *ci) {
    const OffsetVal& lhs = getOrCreateVal(ci->getOperand(0));
    const OffsetVal& rhs = getOrCreateVal(ci->getOperand(1));
    OffsetOperator op = fromCmpPredicate(ci->getPredicate());
    offsets[ci] = BinOpOffsetVal(lhs, op, rhs);
    return offsets[ci];
  }

  const OffsetVal& OffsetPropagation::getOrCreateVal(Constant *c) {
    offsets[c] = ConstOffsetVal(c);
    return offsets[c];
  }

  const OffsetVal& OffsetPropagation::getOrCreateVal(LoadInst *l) {
    //TODO
    offsets[l] = InstOffsetVal(l);
    return offsets[l];
  }

  const OffsetVal& OffsetPropagation::getOrCreateVal(PHINode *p) {
    // TODO: Detect loop case
    bool loop = false;

    if(loop) {
      // TODO: Calculate if the loop iterations are constant, rt-known, or unknown
      offsets[p] = InstOffsetVal(p);

    } else {
      // Get all incoming values
      std::vector<Value *> values;
      std::vector<BasicBlock *> blocks;
      for(int i=0; i<p->getNumIncomingValues(); i++) {
        values.push_back(p->getIncomingValue(i));
        blocks.push_back(p->getIncomingBlock(i));
      }

      // Get the required analysis
      Function &f = *(p->getFunction());
      DominatorTree &DT = getAnalysis<DominatorTreeWrapperPass>(f).getDomTree();

      offsets[p] = applyDominatingCondition(values, blocks, DT);
    }
    return offsets[p];
  }

  const OffsetVal& OffsetPropagation::applyDominatingCondition(
      std::vector<Value *>& values,
      std::vector<BasicBlock *>& blocks,
      DominatorTree& DT) {

    // Base Case
    if(values.size() == 1)
      return getOrCreateVal(values[0]);

    // Locate the common dominator
    BasicBlock *dom = blocks[0];
    for(auto b=blocks.begin(), e=blocks.end(); b != e; ++b) {
      dom = DT.findNearestCommonDominator(dom, *b);
    }

    // Locate the branch exiting the dominator
    BranchInst *b = dyn_cast<BranchInst>(&*dom->rbegin());
    assert(b != nullptr && b->isConditional());

    const OffsetVal& cond = getOrCreateVal(b->getCondition());
    const OffsetVal& ncond = negateCondition(cond);
    BasicBlock *taken = cast<BasicBlock>(b->getOperand(0));

    // Calculate values for recursion
    std::vector<Value *> v_taken;
    std::vector<Value *> v_untaken;
    std::vector<BasicBlock *> b_taken;
    std::vector<BasicBlock *> b_untaken;
    for(int i=0; i<values.size(); i++) {
      if(DT.dominates(taken, blocks[i])) {
        v_taken.push_back(values[i]);
        b_taken.push_back(blocks[i]);
      } else {
        v_untaken.push_back(values[i]);
        b_untaken.push_back(blocks[i]);
      }
    }
    const OffsetVal& off_taken = applyDominatingCondition(v_taken, b_taken, DT);
    const OffsetVal& off_untaken = applyDominatingCondition(v_untaken, b_untaken, DT);

    //returning (c * off_taken) + (!c * off_untaken)
    const OffsetVal& mult_taken = mkvirt(BinOpOffsetVal(cond, Mul, off_taken));
    const OffsetVal& mult_untaken = mkvirt(BinOpOffsetVal(ncond, Mul, off_untaken));
    return mkvirt(BinOpOffsetVal(mult_taken, Add, mult_untaken));
  }

  const OffsetVal& OffsetPropagation::negateCondition(const OffsetVal& cond) {
    assert(isa<BinOpOffsetVal>(cond));
    auto b=dyn_cast<BinOpOffsetVal>(&cond);
    OffsetOperator flipped;
    switch(b->op) {
      case OffsetOperator::Eq: flipped = Neq; break;
      case OffsetOperator::Neq: flipped = Eq; break;
      case OffsetOperator::SLT: flipped = SGE; break;
      case OffsetOperator::SGE: flipped = SLT; break;
      case OffsetOperator::SLE: flipped = SGT; break;
      case OffsetOperator::SGT: flipped = SLE; break;
      case OffsetOperator::ULT: flipped = UGE; break;
      case OffsetOperator::UGE: flipped = ULT; break;
      case OffsetOperator::ULE: flipped = UGT; break;
      case OffsetOperator::UGT: flipped = ULE; break;
      default: flipped = end; break;
    }
    assert(flipped != OffsetOperator::end);
    virtuals.push_back(BinOpOffsetVal(b->lhs, flipped, b->rhs));
    return virtuals.back();
  }

  OffsetOperator OffsetPropagation::fromBinaryOpcode(llvm::Instruction::BinaryOps op) {
    switch(op) {
      case BinaryOperator::Add: return OffsetOperator::Add;
      case BinaryOperator::Sub: return OffsetOperator::Sub;
      case BinaryOperator::Mul: return OffsetOperator::Mul;
      case BinaryOperator::SDiv: return OffsetOperator::SDiv;
      case BinaryOperator::UDiv: return OffsetOperator::UDiv;
      case BinaryOperator::SRem: return OffsetOperator::SRem;
      case BinaryOperator::URem: return OffsetOperator::URem;
      case BinaryOperator::And: return OffsetOperator::And;
      case BinaryOperator::Or: return OffsetOperator::Or;
      case BinaryOperator::Xor: return OffsetOperator::Xor;
      default: return OffsetOperator::end;
    }
  }

  OffsetOperator OffsetPropagation::fromCmpPredicate(llvm::CmpInst::Predicate p) {
    switch(p) {
      case llvm::CmpInst::Predicate::ICMP_EQ: return OffsetOperator::Eq;
      case llvm::CmpInst::Predicate::ICMP_NE: return OffsetOperator::Neq;
      case llvm::CmpInst::Predicate::ICMP_SLT: return OffsetOperator::SLT;
      case llvm::CmpInst::Predicate::ICMP_SLE: return OffsetOperator::SLE;
      case llvm::CmpInst::Predicate::ICMP_SGT: return OffsetOperator::SGT;
      case llvm::CmpInst::Predicate::ICMP_SGE: return OffsetOperator::SGE;
      case llvm::CmpInst::Predicate::ICMP_ULT: return OffsetOperator::ULT;
      case llvm::CmpInst::Predicate::ICMP_ULE: return OffsetOperator::ULE;
      case llvm::CmpInst::Predicate::ICMP_UGT: return OffsetOperator::UGT;
      case llvm::CmpInst::Predicate::ICMP_UGE: return OffsetOperator::UGE;
      default: return OffsetOperator::end;
    }
  }

  const OffsetVal& OffsetPropagation::mkvirt(const OffsetVal& o) {
    virtuals.push_back(o);
    return virtuals.back();
  }
}
