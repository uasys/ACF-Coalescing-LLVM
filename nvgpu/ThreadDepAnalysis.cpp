#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/CFG.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Intrinsics.h"

#include "ThreadDepAnalysis.h"

#include <unordered_map>
#include <queue>
#include <utility>

using namespace std;
using namespace llvm;
using namespace gpucheck;

#define DEBUG_TYPE "threaddep"

bool ThreadDependence::runOnFunction(Function &F) {
  taint.clear();

  // Initialize ourselves
  for(auto v=F.arg_begin(),e=F.arg_end(); v!=e; ++v)
    taint[&*v]=false; // Kernel parameters aren't tainted

  // Everyone gets one look
  for(auto b=F.begin(),e=F.end(); b!=e; ++b) {
    for(auto i=b->begin(),e=b->end(); i!=e; ++i) {
      worklist.push(&*i);
    }
  }

  while(!worklist.empty()) {
    Value *v = worklist.front();
    worklist.pop();

    update(v, isDependent(v));
  }

  DEBUG(
    for(auto b=F.begin(),e=F.end(); b!=e; ++b) {
      for(auto i=b->begin(),e=b->end(); i!=e; ++i) {
        errs() << (taint[&*i] ? "Thread-Dependent" : "Thread-Constant ") << " - ";
        i->dump();
        errs() << "\n";
      }
    }
  );

  return false;
}

void ThreadDependence::update(Value *v, bool newVal) {
  bool oldVal = taint[v];
  taint[v] = newVal;
  if(newVal != oldVal) {
    DEBUG(
      errs() << "Update " << oldVal << "=>" << newVal << " for ";
      v->dump();
      errs() << "\n";
    );

    for(auto user=v->user_begin(),e=v->user_end(); user!=e; ++user) {
      DEBUG(
        errs() << "| Queued: ";
        user->dump();
        errs() << "\n";
      );
      worklist.push(*user);
    }
  }
  if(auto CI=dyn_cast<CallInst>(v)) {
    if(auto F=CI->getCalledFunction()) {
      auto arg=CI->arg_begin();
      for(auto param=F->arg_begin(),e=F->arg_end(); param!=e; ++param) {
        // Forward arguments to parameters ( || loses context sensitivity)
        update(&*param, taint[&*param] || taint[arg->getUser()]);
        ++arg;
      }
    }
  }
}

bool ThreadDependence::isDependent(Value *v) {
  if(auto user=dyn_cast<User>(v)) {
    for(auto op=user->op_begin(),e=user->op_end(); op!=e; ++op) {
      if(taint[op->get()])
        return true;
    }
  }

  // Special-case PHI Nodes
  if(auto PHI=dyn_cast<PHINode>(v)) {
    // If any branch came here on a thread-dependent condition, we're thread dependent
    for(auto b=PHI->block_begin(),e=PHI->block_end(); b!=e; ++b) {
      if(auto BI=dyn_cast<BranchInst>(--((*b)->end()))) {
        // We recieve a value from a tainted branch
        if(BI->isConditional() && taint[BI])
          return true;
      }
    }
  }

  // Calls may directly reference the threadIdx
  if(auto CI=dyn_cast<CallInst>(v)) {
    if(auto F=CI->getCalledFunction()) {
      switch(F->getIntrinsicID()) {
        case Intrinsic::nvvm_read_ptx_sreg_tid_x:
        case Intrinsic::nvvm_read_ptx_sreg_tid_y:
        case Intrinsic::nvvm_read_ptx_sreg_tid_z:
        case Intrinsic::nvvm_read_ptx_sreg_laneid:
          return true;
        default:
          break;
      }
    }
  }

  return false;
}


char ThreadDependence::ID = 0;
static RegisterPass<ThreadDependence> X("threaddep", "Flags thread-dependent values",
                                        false,
                                        true);

#undef DEBUG_TYPE
