#include "OffsetPropagation.h"
#include "OffsetOps.h"
#include "llvm/Analysis/CFG.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/MemoryDependenceAnalysis.h"
#include "llvm/Support/Debug.h"
#include "llvm/IR/Intrinsics.h"

#define DEBUG_TYPE offset-prop

namespace gpucheck {
  using namespace std;

  void OffsetPropagation::getAnalysisUsage(AnalysisUsage& AU) const {
    AU.setPreservesAll();
    AU.addRequired<MemoryDependenceWrapperPass>();
    AU.addRequired<DominatorTreeWrapperPass>();
    AU.addRequired<LoopInfoWrapperPass>();
  }

  bool OffsetPropagation::runOnModule(Module &M) {
    // Save my owned module
    this->M = &M;
    // Empty any calculated results
    this->offsets.clear();

    /*
    for(auto f=M.begin(),e=M.end(); f!=e; ++f)
      for(auto b=f->begin(),e=f->end(); b!=e; ++b)
        for(auto i=b->begin(),e=b->end(); i!=e; ++i) {
           errs() << *i << "\n";
           cout << "    " << "raw = " << *getOrCreateVal(&*i) << "\n";
           OffsetValPtr sop = sumOfProducts(getOrCreateVal(&*i));
           cout << "    " << "sop = " << *sop << "\n";
           OffsetValPtr simp = simplifyOffsetVal(sop);
           cout << "    " << "sim = " << *simp << "\n";
        }

    */
    // OffsetVals are evaluated lazily as required
    return false;
  }

  /**
   * Generic method for any value, used to dispatch to the others
   */
  OffsetValPtr OffsetPropagation::getOrCreateVal(Value *v) {
    if(offsets.count(v))
      return offsets[v];
    if(auto b = dyn_cast<BinaryOperator>(v)) return getOrCreateVal(b);
    if(auto c = dyn_cast<CallInst>(v)) return getOrCreateVal(c);
    if(auto c = dyn_cast<CastInst>(v)) return getOrCreateVal(c);
    if(auto c = dyn_cast<CmpInst>(v)) return getOrCreateVal(c);
    if(auto c = dyn_cast<Constant>(v)) return getOrCreateVal(c);
    if(auto l = dyn_cast<LoadInst>(v)) return getOrCreateVal(l);
    if(auto p = dyn_cast<PHINode>(v)) return getOrCreateVal(p);
    if(auto g = dyn_cast<GetElementPtrInst>(v)) return getOrCreateVal(g);

    // Fallthrough, unknown instruction
    if(auto i=dyn_cast<Instruction>(v)) {
      offsets[v] = make_shared<InstOffsetVal>(i);
      return offsets[v];
    } else if(auto a=dyn_cast<Argument>(v)) {
      offsets[v] = make_shared<ArgOffsetVal>(a);
      return offsets[v];
    }
    return nullptr;
  }

  OffsetValPtr OffsetPropagation::getOrCreateVal(BinaryOperator *bo) {
    // Generate an operator as a function of the binary operator

    OffsetOperator op = fromBinaryOpcode(bo->getOpcode());
    if(op == OffsetOperator::end) {
      // We don't handle this kind of operation
      offsets[bo] = make_shared<InstOffsetVal>(bo);
      return offsets[bo];
    }

    OffsetValPtr lhs = getOrCreateVal(bo->getOperand(0));
    OffsetValPtr rhs = getOrCreateVal(bo->getOperand(1));
    offsets[bo] = make_shared<BinOpOffsetVal>(lhs, op, rhs);
    return offsets[bo];
  }

  OffsetValPtr OffsetPropagation::getOrCreateVal(GetElementPtrInst *gep) {
    // Find the DataLayout
    const DataLayout& DL = gep->getModule()->getDataLayout();

    // We begin with the offset equal to the base
    OffsetValPtr offset = getOrCreateVal(gep->getPointerOperand());

    // Start calculating offsets
    Type *t = gep->getPointerOperandType();
    for(auto i=gep->idx_begin(),e=gep->idx_end(); i!=e; ++i) {
      OffsetValPtr idx_off;

      if(auto struct_t=dyn_cast<StructType>(t)) {
        // Calculate the offset to the struct element
        OffsetValPtr idx = getOrCreateVal(*i);
        assert(idx->isConst()); // Struct references can't be dynamic

        int index = idx->constVal().getZExtValue();
        assert(struct_t->getNumElements() > index);

        // Update the type for next iteration
        t = struct_t->getElementType(index);

        // Calculate the offset for this index
        int elem_off = 0;
        for(int i=0; i<index; ++i) {
          elem_off += DL.getTypeAllocSize(struct_t->getElementType(i));
        }

        // Our element starts at the end of the previous ones
        idx_off = make_shared<ConstOffsetVal>(elem_off);

      } else if(auto seq_t=dyn_cast<SequentialType>(t)) {
        // Calculate the offset to the array element
        OffsetValPtr idx = getOrCreateVal(*i);

        // Calculate the size to step
        OffsetValPtr size = make_shared<ConstOffsetVal>(DL.getTypeAllocSize(seq_t->getElementType()));

        idx_off = make_shared<BinOpOffsetVal>(idx, Mul, size);

        // Update the type for next iteration
        t = seq_t->getElementType();
      } else {
        assert(false && "GEP must index a struct or sequence");
      }
      offset = make_shared<BinOpOffsetVal>(offset, Add, idx_off);
    }
    return offset;
  }

  OffsetValPtr OffsetPropagation::getOrCreateVal(CallInst *ci) {
    //TODO
    offsets[ci] = make_shared<InstOffsetVal>(ci);
    return offsets[ci];
  }

  OffsetValPtr OffsetPropagation::getOrCreateVal(CastInst *ci) {
    // Just drop through the cast for now
    return getOrCreateVal(ci->getOperand(0));
  }

  OffsetValPtr OffsetPropagation::getOrCreateVal(CmpInst *ci) {
    OffsetValPtr lhs = getOrCreateVal(ci->getOperand(0));
    OffsetValPtr rhs = getOrCreateVal(ci->getOperand(1));
    OffsetOperator op = fromCmpPredicate(ci->getPredicate());
    offsets[ci] = make_shared<BinOpOffsetVal>(lhs, op, rhs);
    return offsets[ci];
  }

  OffsetValPtr OffsetPropagation::getOrCreateVal(Constant *c) {
    offsets[c] = make_shared<ConstOffsetVal>(c);
    return offsets[c];
  }

  OffsetValPtr OffsetPropagation::getOrCreateVal(LoadInst *l) {
    Function &f = *l->getFunction();
    MemoryDependenceResults& MD = getAnalysis<MemoryDependenceWrapperPass>(f).getMemDep();
    MemDepResult res = MD.getDependency(l);

    // Store was found through dependence analysis
    if(res.isDef()) {
      if(auto s=dyn_cast<StoreInst>(res.getInst())) {
        offsets[l]=getOrCreateVal(s->getValueOperand());
        return offsets[l];
      }
    } else {
      // Attempt manual discovery
      for(auto b=f.begin(),e=f.end(); b!=e; ++b) {
        for(auto i=b->begin(),e=b->end(); i!=e; ++i) {
          if(auto s=dyn_cast<StoreInst>(i)) {
            if(s->getPointerOperand() == l->getPointerOperand()) {
              offsets[l] = getOrCreateVal(s->getValueOperand());
              return offsets[l];
            }
          }
        }
      }
    }
    // Default, unknown def
    offsets[l] = make_shared<InstOffsetVal>(l);
    return offsets[l];
  }

  OffsetValPtr OffsetPropagation::getOrCreateVal(PHINode *p) {
    // Get the required analysis
    Function &f = *(p->getFunction());
    DominatorTree &DT = getAnalysis<DominatorTreeWrapperPass>(f).getDomTree();
    LoopInfo &LI = getAnalysis<LoopInfoWrapperPass>(f).getLoopInfo();

    // Get all incoming values
    std::vector<Value *> fwd_values, bk_values;
    std::vector<BasicBlock *> fwd_blocks, bk_blocks;

    for(int i=0; i<p->getNumIncomingValues(); i++) {
      // Sort incoming values into forward and back
      bool loopedge = isPotentiallyReachable(p->getParent(), p->getIncomingBlock(i), &DT, &LI);

      if(loopedge) {
        bk_values.push_back(p->getIncomingValue(i));
        bk_blocks.push_back(p->getIncomingBlock(i));
        //errs() << "Found looped value: " << *p->getIncomingValue(i) << "\n";
      } else {
        fwd_values.push_back(p->getIncomingValue(i));
        fwd_blocks.push_back(p->getIncomingBlock(i));
      }
    }


    // Calculate ourselves from non-loops
    offsets[p] = applyDominatingCondition(fwd_values, fwd_blocks, p, DT);

    // TODO: In many cases we can capture loop constructs
    return offsets[p];
  }

  OffsetValPtr OffsetPropagation::applyDominatingCondition(
      std::vector<Value *>& values,
      std::vector<BasicBlock *>& blocks,
      Instruction * mergePt,
      DominatorTree& DT) {

    assert(values.size() == blocks.size());
    assert(values.size() > 0);
    // Base Case
    if(values.size() == 1)
      return getOrCreateVal(values[0]);

    /*
    errs() << "Finding determining condition for values:\n";
    for(auto v=values.begin(),e=values.end(); v!=e; ++v)
      errs() << "\t" << **v << "\n";
    */

    // Locate the common dominator
    BasicBlock *dom = nullptr;
    for(auto b=blocks.begin(), e=blocks.end(); b != e; ++b) {

      if(dom == nullptr)
        dom = *b;
      else
        dom = DT.findNearestCommonDominator(dom, *b);
    }
    assert(dom != nullptr);

    //errs() << "Dominating Block:\n";
    //errs() << "\t" << *dom << "\n";

    // Locate the branch exiting the dominator
    BranchInst *b = dyn_cast<BranchInst>(&*dom->rbegin());
    assert(b != nullptr && b->isConditional());

    OffsetValPtr cond = getOrCreateVal(b->getCondition());
    OffsetValPtr ncond = negateCondition(cond);
    BasicBlock *taken = b->getSuccessor(0);
    BasicBlock *untaken = b->getSuccessor(1);

    /*
    errs() << "Dominating Condition:\n";
      errs() << "\t" << *b << "\n";
    errs() << "Taken Block:\n";
      errs() << "\t" << *taken << "\n";
    errs() << "Untaken Block:\n";
      errs() << "\t" << *untaken << "\n";
    */

    // Calculate values for recursion
    std::vector<Value *> v_taken;
    std::vector<Value *> v_untaken;
    std::vector<BasicBlock *> b_taken;
    std::vector<BasicBlock *> b_untaken;

    // Select for any non-dominating definitions
    for(int i=0; i<values.size(); i++) {
      if(blocks[i] != dom) {
        if(isPotentiallyReachable(taken, blocks[i], &DT, nullptr)) {
          v_taken.push_back(values[i]);
          b_taken.push_back(blocks[i]);
        } else {
          v_untaken.push_back(values[i]);
          b_untaken.push_back(blocks[i]);
        }
      }
    }

    // Insert this definition if this block itself defines the only condition
    for(int i=0; i<values.size(); i++) {
      if(blocks[i] == dom) {
        if(v_taken.size() == 0) {
          v_taken.push_back(values[i]);
          b_taken.push_back(blocks[i]);
        } else {
          v_untaken.push_back(values[i]);
          b_untaken.push_back(blocks[i]);
        }
      }
    }


    assert(v_taken.size() > 0);
    assert(v_untaken.size() > 0);
    OffsetValPtr off_taken = applyDominatingCondition(v_taken, b_taken, mergePt, DT);
    OffsetValPtr off_untaken = applyDominatingCondition(v_untaken, b_untaken, mergePt, DT);

    //returning (c * off_taken) + (!c * off_untaken)
    OffsetValPtr mult_taken = make_shared<BinOpOffsetVal>(cond, Mul, off_taken);
    OffsetValPtr mult_untaken = make_shared<BinOpOffsetVal>(ncond, Mul, off_untaken);
    return make_shared<BinOpOffsetVal>(mult_taken, Add, mult_untaken);
  }

  OffsetValPtr OffsetPropagation::inCallContext(const OffsetValPtr& orig, const CallInst *ci) {
    unordered_map<OffsetValPtr, OffsetValPtr> rep;
    const Function *f = ci->getCalledFunction();
    if (f == nullptr)
      return orig; // Can't map into function

    // Build the map from formals to actuals
    auto f_arg = f->arg_begin();
    auto c_arg = ci->arg_begin();
    while(c_arg != ci->arg_end()) {
      rep[make_shared<ArgOffsetVal>(const_cast<Argument *>(&*f_arg))] = getOrCreateVal(*c_arg);
      ++f_arg;
      ++c_arg;
    }

    return replaceComponents(orig, rep);
  }

  OffsetValPtr OffsetPropagation::inGridContext(const OffsetValPtr& orig, int thread_dimx, int thread_dimy, int thread_dimz, int block_dimx, int block_dimy, int block_dimz) {

    if(auto i_off = dyn_cast<InstOffsetVal>(&*orig)) {
      if(auto ci=dyn_cast<CallInst>(i_off->inst)) {
        Function *f = ci->getCalledFunction();
        if(f != nullptr) {
          switch(f->getIntrinsicID()) {
            case Intrinsic::nvvm_read_ptx_sreg_ntid_x:
              return make_shared<ConstOffsetVal>(thread_dimx);
            case Intrinsic::nvvm_read_ptx_sreg_ntid_y:
              return make_shared<ConstOffsetVal>(thread_dimy);
            case Intrinsic::nvvm_read_ptx_sreg_ntid_z:
              return make_shared<ConstOffsetVal>(thread_dimz);
            case Intrinsic::nvvm_read_ptx_sreg_nctaid_x:
              return make_shared<ConstOffsetVal>(block_dimx);
            case Intrinsic::nvvm_read_ptx_sreg_nctaid_y:
              return make_shared<ConstOffsetVal>(block_dimy);
            case Intrinsic::nvvm_read_ptx_sreg_nctaid_z:
              return make_shared<ConstOffsetVal>(block_dimz);
            default:
              break;
          }
        }
      }
    }

    // Recursive case
    auto bo = dyn_cast<BinOpOffsetVal>(&*orig);
    if(!bo)
      return orig; // This is a leaf node that didn't match

    OffsetValPtr lhs = inGridContext(bo->lhs, thread_dimx, thread_dimy, thread_dimz, block_dimx, block_dimy, block_dimz);

    OffsetValPtr rhs = inGridContext(bo->rhs, thread_dimx, thread_dimy, thread_dimz, block_dimx, block_dimy, block_dimz);

    // Attempt to avoid re-allocation if possible
    if(lhs == bo->lhs && rhs == bo->rhs)
      return orig; // No changes were made
    else
      return make_shared<BinOpOffsetVal>(lhs, bo->op, rhs);
  }

  OffsetValPtr OffsetPropagation::inThreadContext(const OffsetValPtr& orig, int thread_idx, int thread_idy, int thread_idz, int block_idx, int block_idy, int block_idz) {

    if(auto i_off = dyn_cast<InstOffsetVal>(&*orig)) {
      if(auto ci=dyn_cast<CallInst>(i_off->inst)) {
        Function *f = ci->getCalledFunction();
        if(f != nullptr) {
          switch(f->getIntrinsicID()) {
            case Intrinsic::nvvm_read_ptx_sreg_tid_x:
              return make_shared<ConstOffsetVal>(thread_idx);
            case Intrinsic::nvvm_read_ptx_sreg_tid_y:
              return make_shared<ConstOffsetVal>(thread_idy);
            case Intrinsic::nvvm_read_ptx_sreg_tid_z:
              return make_shared<ConstOffsetVal>(thread_idz);
            case Intrinsic::nvvm_read_ptx_sreg_laneid:
              return make_shared<ConstOffsetVal>(thread_idx % 32);
            case Intrinsic::nvvm_read_ptx_sreg_ctaid_x:
              return make_shared<ConstOffsetVal>(block_idx);
            case Intrinsic::nvvm_read_ptx_sreg_ctaid_y:
              return make_shared<ConstOffsetVal>(block_idy);
            case Intrinsic::nvvm_read_ptx_sreg_ctaid_z:
              return make_shared<ConstOffsetVal>(block_idz);
            default:
              break;
          }
        }
      }
    }

    // Recursive case
    auto bo = dyn_cast<BinOpOffsetVal>(&*orig);
    if(!bo)
      return orig; // This is a leaf node that didn't match

    OffsetValPtr lhs = inThreadContext(bo->lhs, thread_idx, thread_idy, thread_idz, block_idx, block_idy, block_idz);

    OffsetValPtr rhs = inThreadContext(bo->rhs, thread_idx, thread_idy, thread_idz, block_idx, block_idy, block_idz);

    // Attempt to avoid re-allocation if possible
    if(lhs == bo->lhs && rhs == bo->rhs)
      return orig; // No changes were made
    else
      return make_shared<BinOpOffsetVal>(lhs, bo->op, rhs);
  }

  OffsetValPtr OffsetPropagation::negateCondition(OffsetValPtr& cond) {
    assert(isa<BinOpOffsetVal>(cond.get()));
    auto b=dyn_cast<BinOpOffsetVal>(cond.get());
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
    return make_shared<BinOpOffsetVal>(b->lhs, flipped, b->rhs);
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

  std::vector<const Function*> OffsetPropagation::findRequiredContexts(const OffsetValPtr& ptr,
      std::vector<const Function*> found) {
    if(auto bo=dyn_cast<BinOpOffsetVal>(&*ptr)) {
      findRequiredContexts(bo->lhs, found);
      findRequiredContexts(bo->rhs, found);
    }
    if(auto arg=dyn_cast<ArgOffsetVal>(&*ptr)) {
      if(find(found.begin(), found.end(), arg->arg->getParent()) == found.end())
        found.push_back(arg->arg->getParent());
    }
    return found;

  }

  vector<const CallInst*> OffsetPropagation::getSameModuleFunctionCallers(const Function *f) {
    vector<const CallInst*> ret;
    for(auto g=f->getParent()->begin(),e=f->getParent()->end(); g != e; ++g) {
      if(auto f=dyn_cast<Function>(g)) {
        for(auto b=f->begin(),e=f->end(); b!=e; ++b) {
          for(auto i=b->begin(),e=b->end(); i!=e; ++i) {
            if(auto* ci=dyn_cast<CallInst>(i)) {
              if(ci->getCalledFunction() == f)
                ret.push_back(ci);
            }
          }
        }
      }
    }
    return ret;
  }
  vector<OffsetValPtr> OffsetPropagation::inContexts(OffsetValPtr& orig) {
    vector<const Function*> empty;
    return inContexts(orig, empty);
  }

  vector<OffsetValPtr> OffsetPropagation::inContexts(OffsetValPtr& orig, std::vector<const Function *>& ignore) {
    vector<const Function *> context = findRequiredContexts(orig);
    vector<OffsetValPtr> ret;

    for(auto f=context.begin(),e=context.end(); f!=e; ++f) {
      vector<const CallInst*> callers = getSameModuleFunctionCallers(*f);
      if(callers.empty())
        continue;

      for(auto ci=callers.begin(),e=callers.end(); ci!=e; ++ci) {
        OffsetValPtr inContext = inCallContext(orig, *ci);
        vector<const Function*> recIgnore = ignore;
        recIgnore.push_back(*f); // Don't allow this function's context to be added again
        vector<OffsetValPtr> recurse = inContexts(inContext, recIgnore);

        // Append the recursed results into my results
        for(auto b=recurse.begin(),e=recurse.end(); b!=e; ++b)
          ret.push_back(*b);
      }

      // Done
      return ret;
    }

    //Fall-through, no additional context can be added
    ret.push_back(orig);
    return ret;
  }
}

char gpucheck::OffsetPropagation::ID = 0;
static RegisterPass<gpucheck::OffsetPropagation> X("offset-prop", "Propagates offsets through expressions",
                                        false,
                                        true);
#undef DEBUG_TYPE
