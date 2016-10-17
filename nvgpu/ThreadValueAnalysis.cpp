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
#include "Utilities.h"
#include <map>

using namespace std;
using namespace llvm;
using namespace gpucheck;

#define DEBUG_TYPE "threadval"

bool ThreadValueAnalysis::runOnModule(Module &M) {
  DL = new DataLayout(&M);
  TD = &getAnalysis<ThreadDependence>();

  // Initialize memoization arrays
  for(int i=0; i<1024; i++) {
    known.push_back(map<Value *,APInt>());
    evalKnown.push_back(map<Value *,APInt>());
  }
  // Set kernel arguments to not thread-divergent
  for(auto F=M.begin(),e=M.end(); F!=e; ++F) {
    if(isKernelFunction(*F)) {
      for(auto a=F->arg_begin(),e=F->arg_end(); a!=e; ++a) {
        int bitwidth = 64;
        if(a->getType()->isIntegerTy())
          bitwidth = a->getType()->getIntegerBitWidth();
        if(a->getType()->isIntegerTy() || a->getType()->isPointerTy())
          for(int i=0; i<1024; i++)
            evalKnown[i].insert(make_pair(&*a, APInt(bitwidth, 0)));
      }
    }
  }

  //TODO: Forward-propagate through calls

  DEBUG(
    for(auto F=M.begin(),e=M.end(); F!=e; ++F) {
      for(auto b=F->begin(),e=F->end(); b!=e; ++b) {
        for(auto i=b->begin(),e=b->end(); i!=e; ++i) {
          APInt *val0 = evaluateForThreadIdx(&*i, 0);
          APInt *val1 = evaluateForThreadIdx(&*i, 1);
          APInt *port0 = threadDepPortion(&*i, 0);
          APInt *port1 = threadDepPortion(&*i, 1);
          if(val0) errs() << *val0; else errs() << "unkown";
          errs() << " - ";
          if(val1) errs() << *val1; else errs() << "unkown";
          errs() << " (";
          if(port0) errs() << *port0; else errs() << "unkown";
          errs() << " - ";
          if(port1) errs() << *port1; else errs() << "unkown";
          errs() << " ) <== ";
          i->dump();
          errs() << "\n";
        }
      }
    }
  );
  return false;
}

APInt* ThreadValueAnalysis::evaluateForThreadIdx(Value *v, int threadID) {
  if(threadID < 0 || threadID > 1024)
    return nullptr;

  const APInt* val = evaluateForThreadIdx(v, APInt(32, threadID, false), evalKnown[threadID]);
  APInt *out = nullptr;
  if(val != nullptr)
    out = new APInt(*val);
  return out;
}

APInt* ThreadValueAnalysis::threadDepPortion(Value *v, int threadID) {
  if(threadID < 0 || threadID > 1024)
    return nullptr;

  const APInt* val = threadDepPortion(v, APInt(32, threadID, false), known[threadID], evalKnown[threadID], TD);
  APInt *out = nullptr;
  if(val != nullptr)
    out = new APInt(*val);
  return out;
}

const APInt* ThreadValueAnalysis::evaluateForThreadIdx(Value *v, APInt threadID, map<Value *, APInt>& known) {
  // Base cases
  if(!v->getType()->isIntegerTy() && !v->getType()->isPointerTy())
    return nullptr;

  if(known.find(v) != known.end()) {
    return &known.find(v)->second;
  }
  if(auto C=dyn_cast<ConstantInt>(v))
    return &(C->getValue());

  if(auto C=dyn_cast<ConstantExpr>(v))
    return evaluateForThreadIdx(C->getAsInstruction(), threadID, known);

  // Recursive cases
  if(auto C=dyn_cast<CastInst>(v)) {
    if(C->isIntegerCast()) {
      const APInt *castedVal = evaluateForThreadIdx(C->getOperand(0), threadID, known);
      if(castedVal != nullptr) {
        known.insert(make_pair(v, castedVal->zextOrTrunc(C->getType()->getIntegerBitWidth())));
        return &known.find(v)->second;
      }
    }
  }

  if(auto P=dyn_cast<PHINode>(v))
    return evaluatePHI(P, threadID, known);

  if(auto CI=dyn_cast<CallInst>(v))
    return evaluateCall(CI, threadID, known);

  if(auto BO=dyn_cast<BinaryOperator>(v))
    return evaluateBinaryOp(BO, threadID, known);

  if(auto CMP=dyn_cast<CmpInst>(v))
    return evaluateCmp(CMP, threadID, known);

  if(auto L=dyn_cast<LoadInst>(v))
    evaluateLoad(L, threadID, known);

  // We don't know
  return nullptr;
}

Value* ThreadValueAnalysis::PHISelectEdge(PHINode *P, APInt threadID, map<Value *, APInt>& known) {
  // Get the dominator tree for this function
  DominatorTree *DT = &getAnalysis<DominatorTreeWrapperPass>(*(P->getParent()->getParent())).getDomTree();

  // To prevent an infinite loop, we inject a dummy value here
  if(auto zero = evaluateForThreadIdx(P->getIncomingValue(0), threadID, known)) {
    known.insert(make_pair(P, *zero));
  } else {
    known.insert(make_pair(P, APInt(P->getType()->getIntegerBitWidth(), 0)));
  }

  // Collect all of the incoming edges
  vector<BasicBlock *> incoming;
  for(auto b=P->block_begin(),e=P->block_end(); b!=e; ++b)
    incoming.push_back(*b);

  // Eliminate incoming edges by removing conditions
  while(incoming.size() > 1) {
    bool eliminated = false;

    // Find the dominating block that determines where we came from
    BasicBlock *dom=incoming[0];
    for(auto b=++incoming.begin(),e=incoming.end(); b!=e; ++b)
      dom = DT->findNearestCommonDominator(dom, *b);

    // Find the determining condition
    if(dom->size() > 0 && isa<BranchInst>(--dom->end())) {
      auto B = dyn_cast<BranchInst>(--dom->end());
      if(B->isConditional()) {
        const APInt *c = evaluateForThreadIdx(B->getCondition(), threadID, known);
        if(c != nullptr) {
          if(c->isNegative() || c->isStrictlyPositive()) {
            // Condition is true
            dom = B->getSuccessor(0);
          } else {
            // Condition is false
            dom = B->getSuccessor(1);
          }
        }
      }
    }

    // Discard any targets that can no longer be reached
    for(auto b=incoming.begin(),e=incoming.end(); b!=e; ++b) {
      if(*b == dom) {
        // drop everything else
        BasicBlock *chosen = *b;
        incoming.clear();
        incoming.push_back(chosen);
        eliminated = true;

      } else if(!DT->properlyDominates(dom, *b)) {
        auto cur = b--;
        incoming.erase(cur);
        eliminated = true;
      }
    }

    // If we failed to evaluate the condition or make progress,
    // just drop the last option
    if(!eliminated)
      incoming.erase(--incoming.end());
  }
  return incoming[0];
}

const APInt* ThreadValueAnalysis::evaluatePHI(PHINode *P, APInt threadID, map<Value *, APInt>& known) {
  Value *incoming = PHISelectEdge(P, threadID, known);
  const APInt *val = evaluateForThreadIdx(incoming, threadID, known);

  if(val == nullptr) {
    // erase our dummy value
    known.erase(P);
    return nullptr;
  } else {
    known.insert(make_pair(P, *val));
    return &known.find(P)->second;
  }
}

const APInt* ThreadValueAnalysis::evaluateLoad(LoadInst *L, APInt threadID, map<Value *, APInt>& known) {
  // Attempt to locate a store sharing an address instruction
  Value *address = L->getPointerOperand();
  for(auto u=address->user_begin(),e=address->user_end(); u!=e; ++u) {
    if(auto S=dyn_cast<StoreInst>(*u)) {
      // To prevent an infinite loop, we inject a dummy value here
      int bitwidth = 64;
      if(L->getType()->isIntegerTy())
        bitwidth = L->getType()->getIntegerBitWidth();
      known.insert(make_pair(L, APInt(bitwidth, 0)));

      const APInt *sIn = evaluateForThreadIdx(S->getValueOperand(), threadID, known);
      // Assume this load takes on the value of this matching store
      if(sIn != nullptr) {
        known.insert(make_pair(L, *sIn));
        return &known.find(L)->second;
      } else {

        // Remove our dummy value
        known.erase(L);
      }
    }
  }
  // We were unable to locate a solvable StoreInst
  return nullptr;
}

const APInt* ThreadValueAnalysis::evaluateBinaryOp(BinaryOperator *BO, APInt threadID, map<Value *, APInt>& known) {
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
  known.insert(make_pair(BO, out));
  return &known.find(BO)->second;
}

const APInt* ThreadValueAnalysis::evaluateCall(CallInst *CI, APInt threadID, map<Value *, APInt>& known) {
  if(auto F=CI->getCalledFunction()) {
    // If ThreadIdx intrinsic, return the threadID value
    switch(F->getIntrinsicID()) {
      // Return the thread ID x value
      case Intrinsic::nvvm_read_ptx_sreg_tid_x:
        known.insert(make_pair(CI, threadID));
        return &known.find(CI)->second;

      // Calculate the lane-id from the thread-id
      case Intrinsic::nvvm_read_ptx_sreg_laneid:
        known.insert(make_pair(CI, threadID.urem(APInt(threadID.getBitWidth(), 32, false))));
        return &known.find(CI)->second;

      // Always assume 1-dimensional threadBlock, block 1
      case Intrinsic::nvvm_read_ptx_sreg_tid_y:
      case Intrinsic::nvvm_read_ptx_sreg_tid_z:
      case Intrinsic::nvvm_read_ptx_sreg_ctaid_x:
      case Intrinsic::nvvm_read_ptx_sreg_ctaid_y:
      case Intrinsic::nvvm_read_ptx_sreg_ctaid_z:
        known.insert(make_pair(CI, APInt(32,0,false)));
        return &known.find(CI)->second;


      // Might as well come up with a blockdim
      case Intrinsic::nvvm_read_ptx_sreg_ntid_x:
      case Intrinsic::nvvm_read_ptx_sreg_nctaid_x:
        known.insert(make_pair(CI, APInt(32,1024,false)));
        return &known.find(CI)->second;

      // Always assume 1-dimensional threadBlock
      case Intrinsic::nvvm_read_ptx_sreg_ntid_y:
      case Intrinsic::nvvm_read_ptx_sreg_ntid_z:
      case Intrinsic::nvvm_read_ptx_sreg_nctaid_y:
      case Intrinsic::nvvm_read_ptx_sreg_nctaid_z:
        known.insert(make_pair(CI, APInt(32,1,false)));
        return &known.find(CI)->second;
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

const APInt* ThreadValueAnalysis::evaluateCmp(CmpInst *CMP, APInt threadID, map<Value *, APInt>& known) {
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
    known.insert(make_pair(CMP, out ? APInt(1,1,false) : APInt(1,0,false)));
    return &known.find(CMP)->second;
  }
  return nullptr;
}

const APInt* ThreadValueAnalysis::threadDepPortion(Value *v, APInt threadID, map<Value *, APInt>& known, map<Value *, APInt>& evalKnown, ThreadDependence *td) {
  // Base cases
  if(!v->getType()->isIntegerTy() && !v->getType()->isPointerTy())
    return nullptr;

  if(!td->isDependent(v) && v->getType()->isIntegerTy())
    // This value is not thread-dependent
    known.insert(make_pair(v, APInt(v->getType()->getIntegerBitWidth(), 0, false)));

  if(known.find(v) != known.end()) {
    return &known.find(v)->second;
  }

  if(auto A=dyn_cast<AllocaInst>(v)) {
    // An allocation is only thread-dependent because of the value stored there
    known.insert(make_pair(v, APInt(64,0,false)));
    return &known.find(v)->second;
  }

  // Recursive cases
  if(auto C=dyn_cast<CastInst>(v)) {
    if(C->isIntegerCast()) {
      const APInt *castedVal = threadDepPortion(C->getOperand(0), threadID, known, evalKnown, td);
      if(castedVal != nullptr) {
        known.insert(make_pair(v, castedVal->zextOrTrunc(C->getType()->getIntegerBitWidth())));
        return &known.find(v)->second;
      }
    }
  }

  if(auto C=dyn_cast<CmpInst>(v)) {
    // We need the actual value of a comparison
    return evaluateForThreadIdx(v, threadID, evalKnown);
  }

  if(auto CI=dyn_cast<CallInst>(v))
    return threadDepCall(CI, threadID, known, evalKnown, td);

  if(auto P=dyn_cast<PHINode>(v))
    return threadDepPHI(P, threadID, known, evalKnown, td);

  if(auto BO=dyn_cast<BinaryOperator>(v))
    return threadDepBinaryOp(BO, threadID, known, evalKnown, td);

  if(auto GEP=dyn_cast<GetElementPtrInst>(v))
    return threadDepGEP(GEP, threadID, known, evalKnown, td);

  if(auto L=dyn_cast<LoadInst>(v))
    return threadDepLoad(L, threadID, known, evalKnown, td);
  // We don't know
  return nullptr;
}

const APInt* ThreadValueAnalysis::threadDepCall(CallInst *CI, APInt threadID, map<Value *, APInt>& known, map<Value *, APInt>& evalKnown, ThreadDependence *td) {
  if(auto F=CI->getCalledFunction()) {
    // If ThreadIdx intrinsic, return the threadID value
    switch(F->getIntrinsicID()) {
      case Intrinsic::nvvm_read_ptx_sreg_tid_x:
        known.insert(make_pair(CI, threadID));
        return &known.find(CI)->second;

      case Intrinsic::nvvm_read_ptx_sreg_laneid:
        known.insert(make_pair(CI, threadID.urem(APInt(threadID.getBitWidth(), 32, false))));
        return &known.find(CI)->second;

      case Intrinsic::nvvm_read_ptx_sreg_tid_y:
      case Intrinsic::nvvm_read_ptx_sreg_tid_z:
        known.insert(make_pair(CI, APInt(threadID.getBitWidth(), 1, false)));
        return &known.find(CI)->second;
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
  // Indirect call, just give up
  return nullptr;
}

const APInt* ThreadValueAnalysis::threadDepPHI(PHINode *P, APInt threadID, map<Value *, APInt>& known, map<Value *, APInt>& evalKnown, ThreadDependence *td) {
  Value *incoming = PHISelectEdge(P, threadID, evalKnown);
  const APInt *val = threadDepPortion(incoming, threadID, known, evalKnown, td);
  evalKnown.erase(P);

  if(val != nullptr) {
    known.insert(make_pair(P, *val));
    return &known.find(P)->second;
  }
  return nullptr;
}

const APInt* ThreadValueAnalysis::threadDepGEP(GetElementPtrInst *GEP, APInt threadID, map<Value *, APInt>& known, map<Value *, APInt>& evalKnown, ThreadDependence *td) {
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
    known.insert(make_pair(GEP, ptrOffset));
    return &known.find(GEP)->second;
  }
  const APInt *offset = threadDepPortion(GEP->idx_begin()->get(), threadID, known, evalKnown, td);
  if(offset == nullptr)
    return nullptr; // We can't determine our offset

  // The dependent index * the size of the elements
  known.insert(make_pair(GEP, *offset * APInt(offset->getBitWidth(),
                                            DL->getTypeAllocSize(GEP->getResultElementType()),
                                            false)));
  return &known.find(GEP)->second;
}

const APInt* ThreadValueAnalysis::threadDepBinaryOp(BinaryOperator *BO, APInt threadID, map<Value *, APInt>& known, map<Value *, APInt>& evalKnown, ThreadDependence *td) {
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
  known.insert(make_pair(BO, out));
  return &known.find(BO)->second;
}
const APInt* ThreadValueAnalysis::threadDepLoad(LoadInst *L, APInt threadID, map<Value *, APInt>& known, map<Value *, APInt>& evalKnown, ThreadDependence *td) {
  // Insert a dummy to break loops
  int bitwidth = 64;
  if(L->getType()->isIntegerTy())
    bitwidth = L->getType()->getIntegerBitWidth();
  known.insert(make_pair(L, APInt(bitwidth, 0)));

  // Attempt to locate a store sharing an address instruction
  Value *address = L->getPointerOperand();
  for(auto u=address->use_begin(),e=address->use_end(); u!=e; ++u) {
    if(auto S=dyn_cast<StoreInst>(u->getUser())) {
      const APInt *sIn = threadDepPortion(S->getValueOperand(), threadID, known, evalKnown, td);
      // Assume this load takes on the value of this matching store
      if(sIn != nullptr) {
        known.insert(make_pair(L, *sIn));
        return &known.find(L)->second;
      }
    }
  }
  // Remove our dummy
  known.erase(L);

  // We were unable to locate a solvable StoreInst
  return nullptr;
}

char ThreadValueAnalysis::ID = 0;
static RegisterPass<ThreadValueAnalysis> X("threadval", "Calculates thread-dependent values",
                                        false,
                                        true);
#undef DEBUG_TYPE
