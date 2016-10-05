#include "LLVMCfg.h"
#include "llvm/IR/Instructions.h"

LLVMCFG::LLVMCFG(Function *f) {
  this->func = f;

  // Create all of the nodes
  for(auto b = f->begin(), e = f->end(); b != e; ++b) {
    for(auto i = b->begin(), e = b->end(); i != e; ++i) {
      Instruction *iPtr = &*i;
      nodes[iPtr] = new LLVMCFGNode(iPtr);
    }
  }

  // Create the intraprocedural edges
  for(auto b = f->begin(), e = f->end(); b != e; ++b) {
    for(auto i = b->begin(), e = b->end(); i != e; ++i) {
      Instruction *cur = &*i;
      auto next = i;
      ++next;
      if(next != b->end())
        edges.insert(new LLVMCFGEdge(getNode(cur),getNode(&*(next)),getWeightFn(cur)));
      else for(auto s=succ_begin(&*b), e=succ_end(&*b); s!=e; ++s) {
        edges.insert(new LLVMCFGEdge(getNode(&*i),getNode(&*(s->begin())),getWeightFn(cur)));
      }
    }
  }

  // Create callsite edges
  for(auto b = f->begin(), e = f->end(); b != e; ++b) {
    for(auto i = b->begin(), e = b->end(); i != e; ++i) {
      if(auto CI=dyn_cast<CallInst>(i)) {
        if(auto F=CI->getCalledFunction())
          edges.insert(new LLVMCFGEdge(getNode(&*i), getCfgFor(F), getWeightFn(&*i), getMergeFn(CI)));
      }
    }
  }

  // Setup entry and exit nodes
  this->entry = getNode(&*(f->getEntryBlock().begin()));
  this->exit = new LLVMCFGNode();

  for(auto b = f->begin(), e = f->end(); b != e; ++b) {
    for(auto i = b->begin(), e = b->end(); i != e; ++i) {
      if(auto ret = dyn_cast<ReturnInst>(i))
        edges.insert(new LLVMCFGEdge(getNode(ret),exit,getWeightIdFn()));
    }
  }
}
