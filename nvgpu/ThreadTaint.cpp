#include "ThreadTaint.h"

#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Intrinsics.h"
#include "llvm/Support/Debug.h"
#include "GenKillTransformer_T.h"

seme_elem_t ThreadTaintCFG::getWeightFn(Instruction *i) const {
  if(auto CI=dyn_cast<CallInst>(i)) {
    Function *callee = call->getCalledFunction();
    if(callee) {
      switch(callee->getIntrinsicID()) {
        case Intrinsic::nvvm_read_ptx_sreg_tid_x:
        case Intrinsic::nvvm_read_ptx_sreg_tid_y:
        case Intrinsic::nvvm_read_ptx_sreg_tid_z:
        case Intrinsic::nvvm_read_ptx_sreg_laneid:
        break;
        case Intrinsic::not_intrinsic:
            //TODO: Connect args to formals
            //TODO: Connect returns to this instruction
        break;
      }
    } else {
        // Ignore functions for which we don't have bodies
    }
  }
}

merge_fn_t getMergeFn(CallInst *CI) const {
  // I have no idea what to do here
}
