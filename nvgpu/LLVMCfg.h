#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/CFG.h"

#include <cstdlib>
#include <unordered_map>
#include <utility>
#include "Cfg.h"

using namespace std;
using namespace llvm;
using namespace wali;

  class LLVMCFGNode : public CFGNode {
    private:
      bool fake;
      Instruction *instruction;
      Value *value;
    public:
      LLVMCFGNode(Instruction *i, Value *v) : instruction(i), value(v), fake(false) {}
      LLVMCFGNode() : fake(true) {
        instruction = (Instruction *) ((size_t) rand());
        value = (value *) ((size_t) rand());
      }
      int getId() const { return *((int*) &instruction); }
      Instruction *getInst() const { return instruction; }
      Value *getValue() const { return value; }
  };

  class LLVMCFGEdge : public CFGEdge {
    public:
      LLVMCFGEdge(CFGNode *s, CFGNode *t, sem_elem_t weight) : weightFn(weight), mergeFn(nullptr) {
        this->src = s;
        this->tgt = t;
        this->callee = nullptr;
      }
      LLVMCFGEdge(CFGNode *s, CFG *t, sem_elem_t weight, merge_fn_t merge) : weightFn(weight), mergeFn(merge) {
        this->src = s;
        this->tgt = nullptr;
        this->callee = t;
      }
      bool isCall() const { return callee == nullptr; }

      sem_elem_t getWeight() const { return weightFn; }
    private:
      sem_elem_t weightFn;
  };

  class LLVMCFG : public CFG {
    private:
      Function *func;
      CFGNode* entry;
      CFGNode* exit;
      unordered_map<Instruction *, unordered_map<Value *, CFGNode *>> nodes;
      set<CFGEdge *> edges;
    public:
      LLVMCFG(Function * f);
      const set<CFGEdge *>& getEdges() const { return edges; }
      CFGNode *getNode(Instruction *i, Value *v) const { return nodes[i][v]; }

      virtual unordered_map<Value *, sem_elem_t> getWeightFn(Instruction *i) const;
      virtual sem_elem_t getWeightIdFn() const;
      virtual LLVMCFG* getCfgFor(Function *) const;
  };

