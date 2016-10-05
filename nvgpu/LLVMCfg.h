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
    public:
      LLVMCFGNode(Instruction *i) : instruction(i), fake(false) {}
      LLVMCFGNode() : fake(true) {
        instruction = (Instruction *) ((size_t) rand());
      }
      int getId() const { return *((int*) &instruction); }
      Instruction *getInst() const { return instruction; }
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
      merge_fn_t getMergeFn() const { return mergeFn; }
    private:
      sem_elem_t weightFn;
      merge_fn_t mergeFn;
  };

  class LLVMCFG : public CFG {
    private:
      Function *func;
      CFGNode* entry;
      CFGNode* exit;
      unordered_map<Instruction *, CFGNode *> nodes;
      set<CFGEdge *> edges;
    public:
      LLVMCFG(Function * f);
      const set<CFGEdge *>& getEdges() const { return edges; }
      CFGNode *getNode(Instruction * i) const { return nodes.find(i)->second; }

      virtual sem_elem_t getWeightFn(Instruction *i) const;
      virtual sem_elem_t getWeightIdFn() const;
      virtual merge_fn_t getMergeFn(CallInst *CI) const;
      virtual LLVMCFG* getCfgFor(Function *) const;
  };

