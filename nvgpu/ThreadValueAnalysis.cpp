#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/CFG.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/Constants.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/IR/DataLayout.h"

#include "ThreadValueAnalysis.h"
#include "ThreadDepAnalysis.h"
#include <map>

using namespace std;
using namespace llvm;
using namespace gpucheck;

#define DEBUG_TYPE "threadval"


bool ThreadValueAnalysis::runOnFunction(Function &F) {
  DL = new DataLayout(F.getParent());
  TD = &getAnalysis<ThreadDependence>();
  // Work lazily
  for(auto b=F.begin(),e=F.end(); b!=e; ++b)
    for(auto i=b->begin(),e=b->end(); i!=e; ++i)
      if(TD->isDependent(&*i)) {
        errs() << "Dependent instruction: ";
        i->dump();
        errs() << "\n";
        APInt* val0 = threadDepPortion(&*i, 0);
        APInt* val1 = threadDepPortion(&*i, 1);
        if(val0 == nullptr)
          errs() << "unknown";
        else
          errs() << *val0;
        errs() << " - ";
        if(val1 == nullptr)
          errs() << "unknown";
        else
          errs() << *val1;
        errs() << "\n";
      }
  return false;
}

APInt* ThreadValueAnalysis::evaluateForThreadIdx(Value *v, int threadID) {
  map<Value *, APInt> lookupTable;
  const APInt* val = evaluateForThreadIdx(v, APInt(32, threadID, false), lookupTable);
  APInt *out = nullptr;
  if(val != nullptr)
    out = new APInt(*val);
  return out;
}

APInt* ThreadValueAnalysis::threadDepPortion(Value *v, int threadID) {
  map<Value *, APInt> lookupTable;
  map<Value *, APInt> evalLookupTable;
  const APInt* val = threadDepPortion(v, APInt(32, threadID, false), lookupTable, evalLookupTable, TD);
  APInt *out = nullptr;
  if(val != nullptr)
    out = new APInt(*val);
  return out;
}

const APInt* ThreadValueAnalysis::evaluateForThreadIdx(Value *v, APInt threadID, map<Value *, APInt>& known) {
  // Base cases
  if(known.find(v) != known.end()) {
    return &known.find(v)->second;
  }
  if(auto C=dyn_cast<ConstantInt>(v))
    return &(C->getValue());

  // Recursive cases
  if(auto C=dyn_cast<CastInst>(v)) {
    if(C->isIntegerCast()) {
      const APInt *castedVal = evaluateForThreadIdx(C->getOperand(0), threadID, known);
      if(castedVal != nullptr) {
        known.insert(make_pair(v, castedVal->zextOrTrunc(C->getType()->getIntegerBitWidth())));
      }
      return &known.find(v)->second;
    }
  }
  if(auto CI=dyn_cast<CallInst>(v)) {
    if(auto F=CI->getCalledFunction()) {
      // If ThreadIdx intrinsic, return the threadID value
      switch(F->getIntrinsicID()) {
        case Intrinsic::nvvm_read_ptx_sreg_tid_x:
          known.insert(make_pair(v, threadID));
          return &known.find(v)->second;

        case Intrinsic::nvvm_read_ptx_sreg_laneid:
          known.insert(make_pair(v, threadID.urem(APInt(threadID.getBitWidth(), 32, false))));
          return &known.find(v)->second;
        default:
          break;
      }

      // If call with body, bind args to formals
      auto arg=CI->arg_begin();
      for(auto param=F->arg_begin(),e=F->arg_end(); param!=e; ++param) {
        const APInt *val = evaluateForThreadIdx(arg->get(), threadID, known);
        if(val != nullptr)
            known.insert(make_pair(&*param, *val));
        ++arg;
      }
      // TODO: This has a potential recursion problem
      for(auto b=F->begin(),e=F->end(); b!=e; ++b)
        for(auto i=b->begin(),e=b->end(); i!=e; ++i)
          if(auto ret=dyn_cast<ReturnInst>(i))
            return evaluateForThreadIdx(ret->getOperand(0), threadID, known);
    }
    return nullptr;
  }

  if(auto C=dyn_cast<ConstantExpr>(v))
    // Evaluate Constant Expressions
    return evaluateForThreadIdx(C->getAsInstruction(), threadID, known);

  if(auto P=dyn_cast<PHINode>(v)) {
    // Do something more clever than returning the first value
    // TODO: This could infinite loop
    return evaluateForThreadIdx(P->getIncomingValue(0), threadID, known);
  }

  if(auto BO=dyn_cast<BinaryOperator>(v)) {
    const APInt *left = evaluateForThreadIdx(BO->getOperand(0), threadID, known);
    const APInt *right = evaluateForThreadIdx(BO->getOperand(1), threadID, known);
    if(left == nullptr || right == nullptr)
      return nullptr;

    APInt out;
    switch(BO->getOpcode()) {
      case BinaryOperator::Add:
        out = (*left + *right);
        break;
      case BinaryOperator::And:
        out = (*left & *right);
        break;
      case BinaryOperator::Or:
        out = (*left | *right);
        break;
      case BinaryOperator::Xor:
        out = (*left ^ *right);
        break;
      case BinaryOperator::Shl:
        out = (*left << *right);
        break;
      case BinaryOperator::AShr:
        out = (left->ashr(*right));
        break;
      case BinaryOperator::LShr:
        out = (left->lshr(*right));
        break;
      case BinaryOperator::Sub:
        out = (*left - *right);
        break;
      case BinaryOperator::Mul:
        out = (*left * *right);
        break;
      case BinaryOperator::SDiv:
        out = (left->sdiv(*right));
        break;
      case BinaryOperator::UDiv:
        out = (left->udiv(*right));
        break;
      case BinaryOperator::SRem:
        out = (left->srem(*right));
        break;
      case BinaryOperator::URem:
        out = (left->urem(*right));
        break;
      // Floating Point ops not handled
      case BinaryOperator::FAdd:
      case BinaryOperator::FSub:
      case BinaryOperator::FMul:
      case BinaryOperator::FDiv:
      case BinaryOperator::FRem:
        return nullptr;
    }
    known.insert(make_pair(v, out));
    return &known.find(v)->second;
  }

  if(auto CMP=dyn_cast<CmpInst>(v)) {
    const APInt *left = evaluateForThreadIdx(CMP->getOperand(0), threadID, known);
    const APInt *right = evaluateForThreadIdx(CMP->getOperand(1), threadID, known);
    if(left == nullptr || right == nullptr)
      return nullptr;

    bool valid = false;
    bool out = false;
    switch(CMP->getPredicate()) {
      case CmpInst::Predicate::ICMP_EQ:
        out = left->eq(*right);
        valid = true;
        break;
      case CmpInst::Predicate::ICMP_NE:
        out = left->ne(*right);
        valid = true;
        break;
      case CmpInst::Predicate::ICMP_ULT:
        out = left->ult(*right);
        valid = true;
        break;
      case CmpInst::Predicate::ICMP_ULE:
        out = left->ule(*right);
        valid = true;
        break;
      case CmpInst::Predicate::ICMP_UGT:
        out = left->ult(*right);
        valid = true;
        break;
      case CmpInst::Predicate::ICMP_UGE:
        out = left->ule(*right);
        valid = true;
        break;
      case CmpInst::Predicate::ICMP_SLT:
        out = left->ult(*right);
        valid = true;
        break;
      case CmpInst::Predicate::ICMP_SLE:
        out = left->ule(*right);
        valid = true;
        break;
      case CmpInst::Predicate::ICMP_SGT:
        out = left->ult(*right);
        valid = true;
        break;
      case CmpInst::Predicate::ICMP_SGE:
        out = left->ule(*right);
        valid = true;
        break;
      default:
        break;
    }
    if(valid) {
      // Construct a boolean APInt
      known.insert(make_pair(v, out ? APInt(1,1,false) : APInt(1,0,false)));
      return &known.find(v)->second;
    }
    return nullptr;
  }

  // We don't know
  return nullptr;
}

const APInt* ThreadValueAnalysis::threadDepPortion(Value *v, APInt threadID, map<Value *, APInt>& known, map<Value *, APInt>& evalKnown, ThreadDependence *td) {
  // Base cases
  if(!td->isDependent(v) && v->getType()->isIntegerTy())
    // This value is not thread-dependent
    known.insert(make_pair(v, APInt(v->getType()->getIntegerBitWidth(), 0, false)));

  if(known.find(v) != known.end()) {
    return &known.find(v)->second;
  }

  // Recursive cases
  if(auto C=dyn_cast<CastInst>(v)) {
    if(C->isIntegerCast()) {
      const APInt *castedVal = threadDepPortion(C->getOperand(0), threadID, known, evalKnown, td);
      if(castedVal != nullptr) {
        known.insert(make_pair(v, castedVal->zextOrTrunc(C->getType()->getIntegerBitWidth())));
      }
      return &known.find(v)->second;
    }
  }

  if(auto C=dyn_cast<CmpInst>(v)) {
    // We need the actual value of a comparison
    return evaluateForThreadIdx(v, threadID, evalKnown);
  }

  if(auto CI=dyn_cast<CallInst>(v)) {
    if(auto F=CI->getCalledFunction()) {
      // If ThreadIdx intrinsic, return the threadID value
      switch(F->getIntrinsicID()) {
        case Intrinsic::nvvm_read_ptx_sreg_tid_x:
          known.insert(make_pair(v, threadID));
          return &known.find(v)->second;

        case Intrinsic::nvvm_read_ptx_sreg_laneid:
          known.insert(make_pair(v, threadID.urem(APInt(threadID.getBitWidth(), 32, false))));
          return &known.find(v)->second;
        default:
          break;
      }

      // If call with body, bind args to formals
      auto arg=CI->arg_begin();
      for(auto param=F->arg_begin(),e=F->arg_end(); param!=e; ++param) {
        const APInt *val = evaluateForThreadIdx(arg->get(), threadID, evalKnown);
        if(val != nullptr)
            known.insert(make_pair(&*param, *val));
        ++arg;
      }
      // TODO: This has a potential recursion problem
      for(auto b=F->begin(),e=F->end(); b!=e; ++b)
        for(auto i=b->begin(),e=b->end(); i!=e; ++i)
          if(auto ret=dyn_cast<ReturnInst>(i))
            return threadDepPortion(ret->getOperand(0), threadID, known, evalKnown, td);
    }
    return nullptr;
  }

  if(auto P=dyn_cast<PHINode>(v)) {
    // Do something more clever than returning the first value
    // TODO: This could infinite loop
    return threadDepPortion(P->getIncomingValue(0), threadID, known, evalKnown, td);
  }

  if(auto BO=dyn_cast<BinaryOperator>(v)) {
    const APInt *leftEval = evaluateForThreadIdx(BO->getOperand(0), threadID, evalKnown);
    const APInt *rightEval = evaluateForThreadIdx(BO->getOperand(1), threadID, evalKnown);
    const APInt *leftDep = threadDepPortion(BO->getOperand(0), threadID, known, evalKnown, td);
    const APInt *rightDep = threadDepPortion(BO->getOperand(1), threadID, known, evalKnown, td);
    bool isLeftDep = td->isDependent(BO->getOperand(0));

    APInt out;
    switch(BO->getOpcode()) {
      case BinaryOperator::Add:
        if(leftDep == nullptr || rightDep == nullptr) return nullptr;
        out = (*leftDep + *rightDep);
        break;

      case BinaryOperator::And:
        // Could be used to implement modulus
        if(isLeftDep) {
          if(leftDep == nullptr || rightEval == nullptr) return nullptr;
          out = (*leftDep & *rightEval);
        } else {
          if(leftEval == nullptr || rightDep == nullptr) return nullptr;
          out = (*leftEval & *rightDep);
        }
        break;
      case BinaryOperator::Or:
        if(leftDep == nullptr || rightDep == nullptr) return nullptr;
        out = (*leftDep | *rightDep);
        break;
      case BinaryOperator::Xor:
        if(leftDep == nullptr || rightDep == nullptr) return nullptr;
        out = (*leftDep ^ *rightDep);
        break;
      case BinaryOperator::Shl:
        if(isLeftDep) {
          if(leftDep == nullptr || rightEval == nullptr) return nullptr;
            out = (*leftDep << *rightEval);
        } else {
          if(leftEval == nullptr || rightDep == nullptr) return nullptr;
            out = (*leftEval << *rightDep);
        }
        break;
      case BinaryOperator::AShr:
        if(isLeftDep) {
          if(leftDep == nullptr || rightEval == nullptr) return nullptr;
            out = (leftDep->ashr(*rightEval));
        } else {
          if(leftEval == nullptr || rightDep == nullptr) return nullptr;
            out = (leftEval->ashr(*rightDep));
        }
      case BinaryOperator::LShr:
        if(isLeftDep) {
          if(leftDep == nullptr || rightEval == nullptr) return nullptr;
            out = (leftDep->lshr(*rightEval));
        } else {
          if(leftEval == nullptr || rightDep == nullptr) return nullptr;
            out = (leftEval->lshr(*rightDep));
        }
        break;
      case BinaryOperator::Sub:
        if(leftDep == nullptr || rightDep == nullptr) return nullptr;
        out = (*leftDep - *rightDep);
        break;
      case BinaryOperator::Mul:
        if(isLeftDep) {
          if(leftDep == nullptr || rightEval == nullptr) return nullptr;
            out = (*leftDep * *rightEval);
        } else {
          if(leftEval == nullptr || rightDep == nullptr) return nullptr;
            out = (*leftEval * *rightDep);
        }
        break;
      case BinaryOperator::SDiv:
        if(isLeftDep) {
          if(leftDep == nullptr || rightEval == nullptr) return nullptr;
            out = (leftDep->sdiv(*rightEval));
        } else {
          if(leftEval == nullptr || rightDep == nullptr) return nullptr;
            out = (leftEval->sdiv(*rightDep));
        }
        break;
      case BinaryOperator::UDiv:
        if(isLeftDep) {
          if(leftDep == nullptr || rightEval == nullptr) return nullptr;
            out = (leftDep->udiv(*rightEval));
        } else {
          if(leftEval == nullptr || rightDep == nullptr) return nullptr;
            out = (leftEval->udiv(*rightDep));
        }
        break;
      case BinaryOperator::SRem:
        if(isLeftDep) {
          if(leftDep == nullptr || rightEval == nullptr) return nullptr;
            out = (leftDep->srem(*rightEval));
        } else {
          if(leftEval == nullptr || rightDep == nullptr) return nullptr;
            out = (leftEval->srem(*rightDep));
        }
        break;
      case BinaryOperator::URem:
        if(isLeftDep) {
          if(leftDep == nullptr || rightEval == nullptr) return nullptr;
            out = (leftDep->urem(*rightEval));
        } else {
          if(leftEval == nullptr || rightDep == nullptr) return nullptr;
            out = (leftEval->urem(*rightDep));
        }
        break;
      // Floating Point ops not handled
      case BinaryOperator::FAdd:
      case BinaryOperator::FSub:
      case BinaryOperator::FMul:
      case BinaryOperator::FDiv:
      case BinaryOperator::FRem:
        return nullptr;
    }
    known.insert(make_pair(v, out));
    return &known.find(v)->second;
  }

  if(auto GEP=dyn_cast<GetElementPtrInst>(v)) {
    APInt ptrOffset = APInt(64, 0, false);

    // First lock down our base pointer
    if(td->isDependent(GEP->getPointerOperand())) {
      const APInt *amount = threadDepPortion(GEP->getPointerOperand(), threadID, known, evalKnown, td);
      if(amount == nullptr)
        return nullptr; // We don't know our pointer base
      ptrOffset = *amount;
    }
    if(GEP->idx_begin() == GEP->idx_end()) {
      // There is no offset, we're done here
      known.insert(make_pair(v, ptrOffset));
      return &known.find(v)->second;
    }
    const APInt *offset = threadDepPortion(GEP->idx_begin()->get(), threadID, known, evalKnown, td);
    if(offset == nullptr)
      return nullptr; // We can't determine our offset

    // The dependent index * the size of the elements
    known.insert(make_pair(v, *offset * APInt(offset->getBitWidth(),
                                              DL->getTypeAllocSize(GEP->getResultElementType()),
                                              false)));
    return &known.find(v)->second;
  }

  // We don't know
  return nullptr;
}

char ThreadValueAnalysis::ID = 0;
static RegisterPass<ThreadValueAnalysis> X("threadval", "Calculates thread-dependent values",
                                        false,
                                        true);
#undef DEBUG_TYPE
