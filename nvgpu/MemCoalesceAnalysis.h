#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"

#include "BugEmitter.h"
#include "ThreadDepAnalysis.h"
#include "ThreadValueAnalysis.h"

#ifndef MEM_COALESCE_H
#define MEM_COALESCE_H

namespace gpucheck {

  enum MemAccess {
    Read,
    Write,
    Update,
    Unknown
  };

  class MemCoalesceAnalysis : public ModulePass {
    public:
      static char ID;
      MemCoalesceAnalysis() : ModulePass(ID) {}
      void getAnalysisUsage(AnalysisUsage &AU) const {
        AU.setPreservesAll();
        AU.addRequired<ThreadDependence>();
        AU.addRequired<ThreadValueAnalysis>();
      }
      bool runOnModule(Module &M);
      bool runOnKernel(Function &F);
      float requestsPerWarp(Value *ptr);
      MemAccess getAccessType(Instruction *i, Value *address);
      string getWarning(Value *ptr, MemAccess tpe, float requestsPerWarp, Severity& severity);
    private:
      ThreadDependence *TD;
      ThreadValueAnalysis *TV;
  };

}

#endif
