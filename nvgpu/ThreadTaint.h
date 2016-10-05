#include "LLVMCfg.h"

class ThreadTaintCFG : public LLVMCFG {
  public:
    ThreadTaintCFG(Function *f) : LLVMCFG(f) {}

    sem_elem_t getWeightFn(Instruction *i) const;
    merge_fn_t getMergeFn(CallInst *CI) const;
    LLVMCFG* getCfgFor(Function *) const;
}
