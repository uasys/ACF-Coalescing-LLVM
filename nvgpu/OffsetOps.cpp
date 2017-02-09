#include "ThreadDepAnalysis.h"
#include "OffsetOps.h"

using namespace llvm;
using namespace std;

namespace gpucheck {

  OffsetValPtr negateCondition(OffsetValPtr& cond) {
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

  OffsetValPtr sumOfProducts(OffsetValPtr ov) {
    auto bo=dyn_cast<BinOpOffsetVal>(&*ov);
    if(bo == nullptr)
      return ov;

    // We're working with a binary operator
    OffsetValPtr lhs = sumOfProducts(bo->lhs);
    OffsetValPtr rhs = sumOfProducts(bo->rhs);

    if(bo->op == OffsetOperator::Mul) {
      auto lhs_bo=dyn_cast<BinOpOffsetVal>(&*lhs);
      if(lhs_bo != nullptr && (lhs_bo->op == OffsetOperator::Add || lhs_bo->op == OffsetOperator::Sub)) {
        // Multiply RHS into LHS operands
        auto new_lhs = make_shared<BinOpOffsetVal>(lhs_bo->lhs, bo->op, rhs);
        auto new_rhs = make_shared<BinOpOffsetVal>(lhs_bo->rhs, bo->op, rhs);
        return make_shared<BinOpOffsetVal>(new_lhs, lhs_bo->op, new_rhs);
      }

      auto rhs_bo=dyn_cast<BinOpOffsetVal>(&*rhs);
      if(rhs_bo != nullptr && (rhs_bo->op == OffsetOperator::Add || rhs_bo->op == OffsetOperator::Sub)) {
        // Multiply LHS into RHS operands
        auto new_lhs = make_shared<BinOpOffsetVal>(lhs, bo->op, rhs_bo->lhs);
        auto new_rhs = make_shared<BinOpOffsetVal>(lhs, bo->op, rhs_bo->rhs);
        return make_shared<BinOpOffsetVal>(new_lhs, rhs_bo->op, new_rhs);
      }
    }

    // Just return the sum-of-productsed operands
    return make_shared<BinOpOffsetVal>(lhs, bo->op, rhs);
  }

  OffsetValPtr simplifyConditions(OffsetValPtr lhs, OffsetOperator op, OffsetValPtr rhs) {
    // Convert (cond_1 - cond_2) to (cond_1*(!cond_2))
    if(auto bo_lhs=dyn_cast<BinOpOffsetVal>(&*lhs)) {
      if(auto bo_rhs=dyn_cast<BinOpOffsetVal>(&*lhs)) {
        if(bo_lhs->isCompare() && bo_rhs->isCompare() && op == OffsetOperator::Sub) {
          return make_shared<BinOpOffsetVal>(lhs, OffsetOperator::Mul, negateCondition(rhs));
        }
      }
    }
    return nullptr;
  }

  OffsetValPtr simplifyConstantVal(OffsetValPtr lhs, OffsetOperator op, OffsetValPtr rhs) {
    assert(lhs->isConst() && rhs->isConst());
    APInt lhsi = lhs->constVal();
    APInt rhsi = rhs->constVal();

    // Always just work in the larger bitwidth
    if(lhsi.getBitWidth() > rhsi.getBitWidth())
      rhsi = rhsi.zext(lhsi.getBitWidth());

    if(rhsi.getBitWidth() > lhsi.getBitWidth())
      lhsi = lhsi.zext(rhsi.getBitWidth());

    APInt out;
    switch(op) {
      case OffsetOperator::Add: out = lhsi + rhsi; break;
      case OffsetOperator::Sub: out = lhsi - rhsi; break;
      case OffsetOperator::Mul: out = lhsi * rhsi; break;
      case OffsetOperator::SDiv: out = lhsi.sdiv(rhsi); break;
      case OffsetOperator::UDiv: out = lhsi.udiv(rhsi); break;
      case OffsetOperator::SRem: out = lhsi.srem(rhsi); break;
      case OffsetOperator::URem: out = lhsi.urem(rhsi); break;
      case OffsetOperator::And: out = lhsi.And(rhsi); break;
      case OffsetOperator::Or: out = lhsi.Or(rhsi); break;
      case OffsetOperator::Xor: out = lhsi.Xor(rhsi); break;
      case OffsetOperator::Eq: out = lhsi.eq(rhsi); break;
      case OffsetOperator::Neq: out = lhsi.ne(rhsi); break;
      case OffsetOperator::SLT: out = lhsi.slt(rhsi); break;
      case OffsetOperator::SLE: out = lhsi.sle(rhsi); break;
      case OffsetOperator::ULT: out = lhsi.ult(rhsi); break;
      case OffsetOperator::ULE: out = lhsi.ule(rhsi); break;
      case OffsetOperator::SGT: out = lhsi.sgt(rhsi); break;
      case OffsetOperator::SGE: out = lhsi.sge(rhsi); break;
      case OffsetOperator::UGT: out = lhsi.ugt(rhsi); break;
      case OffsetOperator::UGE: out = lhsi.uge(rhsi); break;
      case OffsetOperator::end: assert(false); break;
    }
    return make_shared<ConstOffsetVal>(out);
  }

  OffsetValPtr simplifyOffsetVal(OffsetValPtr ov) {
    auto bo=dyn_cast<BinOpOffsetVal>(&*ov);
    if(bo == nullptr)
      return ov;

    OffsetValPtr lhs = simplifyOffsetVal(bo->lhs);
    OffsetValPtr rhs = simplifyOffsetVal(bo->rhs);
    if(lhs->isConst() && rhs->isConst())
      return simplifyConstantVal(lhs, bo->op, rhs);

    switch(bo->op) {
      case OffsetOperator::Add:
      {
        // Adding zero does nothing
        if(rhs->isConst() && rhs->constVal() == 0)
          return lhs;
        if(lhs->isConst() && lhs->constVal() == 0)
          return rhs;
      }
      case OffsetOperator::Sub:
      {
        if(rhs->isConst() && rhs->constVal() == 0)
          return lhs;
        if(auto new_bo = simplifyConditions(lhs, bo->op, rhs))
          return simplifyOffsetVal(new_bo);

      }
      case OffsetOperator::Mul:
      {
        // Zeroes destroy the entire tree
        if(rhs->isConst() && rhs->constVal() == 0)
          return rhs;
        if(lhs->isConst() && lhs->constVal() == 0)
          return lhs;
        // Ones have no effect
        if(rhs->isConst() && rhs->constVal() == 1)
          return lhs;
        if(lhs->isConst() && lhs->constVal() == 1)
          return rhs;
      }
      case OffsetOperator::SDiv:
      case OffsetOperator::UDiv:
      {
        // Dividing by one does nothing
        if(rhs->isConst() && rhs->constVal() == 1)
          return lhs;
        // 0/anything is zero
        if(lhs->isConst() && lhs->constVal() == 0)
          return lhs;
      }
    }
    // Just return the simplified components
    return make_shared<BinOpOffsetVal>(lhs, bo->op, rhs);
  }

  bool matchingOffsets(OffsetValPtr lhs, OffsetValPtr rhs) {
    if(lhs->isConst() && rhs->isConst())
      return lhs->constVal() == rhs->constVal();

    auto i_lhs = dyn_cast<InstOffsetVal>(&*lhs);
    auto i_rhs = dyn_cast<InstOffsetVal>(&*rhs);
    if(i_lhs && i_rhs) {
      return (i_lhs->inst == i_rhs->inst);
    }

    auto a_lhs = dyn_cast<ArgOffsetVal>(&*lhs);
    auto a_rhs = dyn_cast<ArgOffsetVal>(&*rhs);
    if(a_lhs && a_rhs) {
      return (a_lhs->arg == a_rhs->arg);
    }

    auto u_lhs = dyn_cast<UnknownOffsetVal>(&*lhs);
    auto u_rhs = dyn_cast<UnknownOffsetVal>(&*rhs);
    if(u_lhs && u_rhs) {
      return (u_lhs->cause == u_rhs->cause);
    }

    auto bo_lhs = dyn_cast<BinOpOffsetVal>(&*lhs);
    auto bo_rhs = dyn_cast<BinOpOffsetVal>(&*rhs);
    if(bo_lhs && bo_rhs) {
      return bo_lhs->op == bo_rhs->op
        && matchingOffsets(bo_lhs->lhs, bo_rhs->lhs)
        && matchingOffsets(bo_lhs->rhs, bo_rhs->rhs);
    }

    return false;
  }

  bool equalOffsets(OffsetValPtr lhs, OffsetValPtr rhs, ThreadDependence& td) {
    assert(lhs != nullptr);
    assert(rhs != nullptr);
    if(lhs->isConst() && rhs->isConst())
      return lhs->constVal() == rhs->constVal();

    auto i_lhs = dyn_cast<InstOffsetVal>(&*lhs);
    auto i_rhs = dyn_cast<InstOffsetVal>(&*rhs);
    if(i_lhs && i_rhs) {
      if(i_lhs->inst == i_rhs->inst)
        return !td.isDependent(const_cast<Instruction *>(i_lhs->inst));
    }

    auto a_lhs = dyn_cast<ArgOffsetVal>(&*lhs);
    auto a_rhs = dyn_cast<ArgOffsetVal>(&*rhs);
    if(a_lhs && a_rhs) {
      if(a_lhs->arg == a_rhs->arg)
        return !td.isDependent(const_cast<Argument *>(a_lhs->arg));
    }

    auto u_lhs = dyn_cast<UnknownOffsetVal>(&*lhs);
    auto u_rhs = dyn_cast<UnknownOffsetVal>(&*rhs);
    if(u_lhs && u_rhs) {
      if(u_lhs->cause == u_rhs->cause)
        return !td.isDependent(const_cast<Value *>(u_lhs->cause));
    }

    auto bo_lhs = dyn_cast<BinOpOffsetVal>(&*lhs);
    auto bo_rhs = dyn_cast<BinOpOffsetVal>(&*rhs);
    if(bo_lhs && bo_rhs) {
      return bo_lhs->op == bo_rhs->op
        && equalOffsets(bo_lhs->lhs, bo_rhs->lhs, td)
        && equalOffsets(bo_lhs->rhs, bo_rhs->rhs, td);
    }

    return false;
  }

  void addToVector(const OffsetValPtr& ov, vector<OffsetValPtr>& add, vector<OffsetValPtr>&sub, bool isSub = false) {
    assert(ov != nullptr);
    auto bo = dyn_cast<BinOpOffsetVal>(&*ov);
    if(bo != nullptr) {
      if(bo->op == Add) {
        addToVector(bo->lhs, add, sub, isSub);
        addToVector(bo->rhs, add, sub, isSub);
        return;
      }
      if(bo->op == Sub) {
        addToVector(bo->lhs, add, sub, isSub);
        addToVector(bo->rhs, add, sub, !isSub);
        return;
      }
    }
    if(isSub) {
      sub.push_back(ov);
    } else {
      add.push_back(ov);
    }
  }

  OffsetValPtr cancelDiffs(OffsetValPtr ov, ThreadDependence& td) {
    assert(ov != nullptr);
    OffsetValPtr sop = sumOfProducts(ov);
    // Convert from binary tree to n-ary addition and subtraction
    vector<OffsetValPtr> added;
    vector<OffsetValPtr> subtracted;
    added.clear();
    subtracted.clear();
    addToVector(ov, added, subtracted);

    // Cancel any matching trees in the sums
    bool changed = true;
    while(changed) {
      changed = false;
      for(auto o_a=added.begin(),e_a=added.end(); o_a!=e_a; ++o_a) {
        for(auto o_s=subtracted.begin(),e_s=subtracted.end(); o_s!=e_s; ++o_s) {
          assert(*o_s != nullptr);
          if(equalOffsets(*o_a, *o_s, td)) {
            added.erase(o_a);
            subtracted.erase(o_s);
            changed = true;
            break;
          }
        }
        if(changed)
          break;
      }
    }

    // Rebuild the binary tree
    OffsetValPtr ret = (added.size() == 0) ? make_shared<ConstOffsetVal>(0) : added.back();
    if(added.size() > 0)
      added.pop_back();

    while(added.size() > 0) {
      ret = make_shared<BinOpOffsetVal>(ret, Add, added.back());
      added.pop_back();
    }

    while(subtracted.size() > 0) {
      ret = make_shared<BinOpOffsetVal>(ret, Sub, subtracted.back());
      subtracted.pop_back();
    }
    return simplifyOffsetVal(ret);
  }

  OffsetValPtr replaceComponents(const OffsetValPtr& orig, std::unordered_map<OffsetValPtr, OffsetValPtr>& rep) {
    // Our loose definition of equality is a problem here
    for(auto r=rep.begin(),e=rep.end(); r!=e; ++r) {
      // Perform a tree-match
      if(matchingOffsets(orig, r->first))
        return r->second;
    }

    auto bo = dyn_cast<BinOpOffsetVal>(&*orig);
    if(!bo)
      return orig; // This is a leaf node that didn't match

    OffsetValPtr lhs = replaceComponents(bo->lhs, rep);
    OffsetValPtr rhs = replaceComponents(bo->rhs, rep);

    // Attempt to avoid re-allocation if possible
    if(lhs == bo->lhs && rhs == bo->rhs)
      return orig; // No changes were made
    else
      return make_shared<BinOpOffsetVal>(lhs, bo->op, rhs);
  }
}
