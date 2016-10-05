#include "LLVMCfg.h"
#include "VarSet.h"

#include "wali/SemElem.hpp"

class ThreadTaintCFG : public LLVMCFG {
  public:
    ThreadTaintCFG(Function *f) : LLVMCFG(f) {}

    sem_elem_t getWeightFn(Instruction *i) const;
    merge_fn_t getMergeFn(CallInst *CI) const;
    LLVMCFG* getCfgFor(Function *) const;
}

class TaintSemElem : public SemElem {
  private:
    VarSet vars;
    bool addCondition

  public:
    TaintSemElem() : {}
    sem_elem_t one() const;
    sem_elem_t zero() const;
    sem_elem_t combine(SemElem *se) const;
    sem_elem_t extend(SemElem *se) const;
    bool equal(SemElem *se) const;
}

class TaintMergeFn : public MergeFn {
  private:

  public:
    TaintMergeFn() : {}
    sem_elem_t apply_f(sem_elem_t w1, sem_elem_t w2) const;
    bool equal(merge_fn_t mf) const;
}
