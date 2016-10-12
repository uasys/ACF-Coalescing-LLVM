#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Instruction.h"

#include <queue>
#include <unordered_map>

#ifndef THREAD_DEP_H
#define THREAD_DEP_H

using namespace std;
using namespace llvm;

namespace gpucheck {

  class ThreadDependence : public FunctionPass {
  public:
    static char ID;
    ThreadDependence() : FunctionPass(ID) {}
    bool runOnFunction(Function &F);
    bool isDependent(Value *v);
  private:
    void update(Value *v, bool newVal);
    queue<Value *> worklist;
    unordered_map<Value *,bool> taint;
  };
} // End gpucheck

#endif
