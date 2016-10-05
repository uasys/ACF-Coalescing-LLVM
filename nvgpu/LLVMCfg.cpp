#include "LLVMCfg.h"
#include "llvm/IR/Instructions.h"

LLVMCFG::LLVMCFG(Function *f) {
  this->func = f;

  // Create all of the nodes
  for(auto b = f->begin(), e = f->end(); b != e; ++b) {
    for(auto i = b->begin(), e = b->end(); i != e; ++i) {
      Instruction *iPtr = &*i;
      for(auto b = f->begin(), e = f->end(); b != e; ++b) {
        for(auto val = b->begin(), e = b->end(); val != e; ++val) {
          Value *vPtr = &*val;
          nodes[iPtr][vPtr] = new LLVMCFGNode(iPtr,vPtr);
        }
      }
      // Include function parameters as tracked values
      for(auto val = f->arg_begin(), e = f->arg_end(); v != e; ++v) {
          Value *vPtr = &*val;
          nodes[iPtr][vPtr] = new LLVMCFGNode(iPtr,vPtr);
      }
    }
  }

  // Create the intraprocedural edges
  for(auto b = f->begin(), e = f->end(); b != e; ++b) {
    for(auto i = b->begin(), e = b->end(); i != e; ++i) {
      Instruction *cur = &*i;
      auto next = i;
      ++next;
      }
    }
  }

  // Create callsite edges
  for(auto b = f->begin(), e = f->end(); b != e; ++b) {
    for(auto i = b->begin(), e = b->end(); i != e; ++i) {
      if(auto CI=dyn_cast<CallInst>(i)) {
        if(auto F=CI->getCalledFunction())
          edges.insert(new LLVMCFGEdge(getNode(&*i), getCfgFor(F), getWeightFn(&*i)));
      }
    }
  }

  // Setup entry and exit nodes
  this->entry = new LLVMCFGNode();
  this->exit = new LLVMCFGNode();

  Instruction *entry = &*(f->getEntryBlock().begin());

  for(auto b = f->begin(), e = f->end(); b != e; ++b) {
    for(auto i = b->begin(), e = b->end(); i != e; ++i) {
      edges.insert(new LLVMCFGEdge(this->entry, getNode(entry, &*i)));

  for(auto b = f->begin(), e = f->end(); b != e; ++b) {
    for(auto i = b->begin(), e = b->end(); i != e; ++i) {
      if(auto ret = dyn_cast<ReturnInst>(i)) {
        for(auto b = f->begin(), e = f->end(); b != e; ++b) {
          for(auto v = b->begin(), e = b->end(); v != e; ++v) {
            edges.insert(new LLVMCFGEdge(getNode(ret, &*v),exit,getWeightIdFn()));
          }
        }
      }
    }
  }
}
