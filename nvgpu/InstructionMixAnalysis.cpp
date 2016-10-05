#include "llvm/Pass.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/CFG.h"
#include "llvm/Support/Debug.h"
#include <iostream>
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/Instructions.h"
#include "llvm/IR/Intrinsics.h"


#include "wali/Common.hpp"
#include "wali/wpds/WPDS.hpp"
#include "wali/wfa/WFA.hpp"
#include "wali/KeySource.hpp"

#include "Cfg.h"

#include <unordered_map>
#include <utility>

using namespace std;
using namespace llvm;
using namespace wali;

#define DEBUG_TYPE "threaddep"

namespace {

  class LLVMSource : public KeySource
  {
    public:
      LLVMSource( Instruction *i): inst(i) {}

      bool equal(KeySource* rhs) {
        LLVMSource *lsrc = (LLVMSource*) rhs;
        return lsrc->inst == inst;
      }

      size_t hash() const {
          return (size_t) inst;
      }

      std::ostream& print( std::ostream& o ) const {
          if(inst->hasName())
              o << inst->getName().str();
          else
              o << inst;
      }

      Instruction *getInst() const { return inst; }
    private:

      Instruction *inst;
  };

  class ThreadDependent : public SemElem {
    public:
      ThreadDependent(bool b) : dependent(b) {}
      virtual ~ThreadDependent() {}
      sem_elem_t one() const { return new ThreadDependent(true); }
      sem_elem_t zero() const { return new ThreadDependent(false); }
      sem_elem_t extend(SemElem * rhs) {
        ThreadDependent *td = static_cast<ThreadDependent*>(rhs);
        return new ThreadDependent(dependent && td->dependent);
      }
      sem_elem_t combine(SemElem * rhs) {
        ThreadDependent *td = static_cast<ThreadDependent*>(rhs);
        return new ThreadDependent(dependent || td->dependent);
      }
      bool equal(SemElem *rhs) const {
        ThreadDependent *td = static_cast<ThreadDependent*>(rhs);
        return td->dependent == dependent;
      }
      ostream& print(ostream& o) const {
          return (dependent) ? o << "Propagate" : o << "Constant";
      }
      bool isDependent() const { return dependent; }
    protected:
      bool dependent;
  };

  class ThreadDependence : public ModulePass {
  public:
    static char ID;
    ThreadDependence() : ModulePass(ID) {}
    bool runOnModule(Module &M);
    void generateKeys(Module& M);
    void generateRules(Module& M, wpds::WPDS& Wpds);
    bool isThreadDependent(wpds::WPDS& Wpds, Instruction *inst);

    wali::Key& programKey() { return progKey; }
    wali::Key& threadIDKey() { return threadKey; }
    wali::Key& acceptKey() { return threadKey; }
  private:
    unordered_map<Instruction *,wali::Key> keys;
    wali::Key& getKey(Instruction *inst);
    wali::Key progKey, threadKey, accept;
  };
} // End anonymous namespace


bool ThreadDependence::runOnModule(Module &M) {
  DEBUG(errs() << "Hello World\n");
  wpds::WPDS Wpds;
  generateKeys(M);
  generateRules(M, Wpds);
  Wpds.print(std::cout);

  for(auto f = M.begin(), e = M.end(); f != e; ++f) {
    for(auto b = f->begin(), e = f->end(); b != e; ++b) {
      for(auto i = b->begin(), e = b->end(); i != e; ++i) {
        if(isThreadDependent(Wpds, &*i));
          errs() << *i << " is Thread-Dependent\n";
      }
    }
  }

}

void ThreadDependence::generateKeys(Module &M) {
  progKey = wali::getKey("program");
  threadKey = wali::getKey("threadIdx");
  accept = wali::getKey("accept");
  for(auto f = M.begin(), e = M.end(); f != e; ++f) {
    for(auto b = f->begin(), e = f->end(); b != e; ++b) {
      for(auto i = b->begin(), e = b->end(); i != e; ++i) {
        Instruction *iPtr = &*i;
        keys.insert(make_pair(iPtr,wali::getKey(new LLVMSource(iPtr))));
      }
    }
  }
}

void ThreadDependence::generateRules(Module &M, wpds::WPDS& Wpds) {
  Key& progKey = programKey();
  sem_elem_t one = new ThreadDependent(true);
  for(auto f = M.begin(), e = M.end(); f != e; ++f) {
    for(auto b = f->begin(), e = f->end(); b != e; ++b) {
      for(auto i = b->begin(), e = b->end(); i != e; ++i) {
        Key& instKey = getKey(&*i);

        // Propagate an instruction's operands
        for(auto op = i->op_begin(), e = i->op_end(); op != e; ++op) {
          if(auto op_inst = dyn_cast<Instruction>(op))
            Wpds.add_rule(progKey, getKey(op_inst), progKey, instKey, one);
        }

        // Handle PHINode incoming conditions
        if(auto phi = dyn_cast<PHINode>(i)) {
            // TODO: Dependent on incoming branch conditions if not from this block
        }

        // Handle Function call conditions
        if(auto call = dyn_cast<CallInst>(i)) {
          Function *callee = call->getCalledFunction();
          if(!callee) {
            // TODO: Handle indirect calls optimistically or soundly
          } else {
            switch(callee->getIntrinsicID()) {
              case Intrinsic::nvvm_read_ptx_sreg_tid_x:
              case Intrinsic::nvvm_read_ptx_sreg_tid_y:
              case Intrinsic::nvvm_read_ptx_sreg_tid_z:
              case Intrinsic::nvvm_read_ptx_sreg_laneid:
                Wpds.add_rule(progKey, threadIDKey(), progKey, instKey, one);
              break;
              case Intrinsic::not_intrinsic:
                //TODO: Connect args to formals
                //TODO: Connect returns to this instruction
              break;
            }
          }
        }
      }
    }
  }
}

bool ThreadDependence::isThreadDependent(wpds::WPDS& Wpds, Instruction *inst) {
  wfa::WFA query;
  query.addTrans(programKey(), threadIDKey(), accept, new ThreadDependent(true));
  query.set_initial_state(programKey());
  query.add_final_state(acceptKey());

  wfa::WFA answer;
  Wpds.poststar(query, answer);

  answer.print_dot( std::cout , true);
  wfa::Trans t;
  if(answer.find(programKey(), getKey(inst), accept, t)) {
      ThreadDependent *td = static_cast<ThreadDependent*>(&*t.weight());
      return td->isDependent();
  }
  return false;
}

Key& ThreadDependence::getKey(Instruction *inst) {
    auto it = keys.find(inst);
    return it->second;
}

char ThreadDependence::ID = 0;
static RegisterPass<ThreadDependence> X("threaddep", "Flags thread-dependent values",
                                        false,
                                        true);

#undef DEBUG_TYPE
