#include <iostream>
#include "llvm/ADT/APInt.h"
#include "llvm/IR/Constant.h"
#include "llvm/IR/Instruction.h"

#ifndef OFFSET_VAL_H
#define OFFSET_VAL_H

namespace gpucheck {
  /**
   * Enable any class with method print(ostream) to be used with the streaming API
   */
  template<class T>
  auto operator<<(std::ostream& os, const T& t) -> decltype(t.print(os), os)
  {
    t.print(os);
    return os;
  }

  /**
   * Generic superclass for offsets
   */
  class OffsetVal {
    public:
      /**
       * Returns true if this OffsetVal contains only a constant part
       */
      virtual bool isConst() const;
      /**
       * Returns an APInt representing this OffsetVal, if it's constant
       */
      virtual const llvm::APInt& constVal() const;
      /**
       * Print a human-readable representation of this value
       */
      virtual void print(std::ostream& stream) const;
  };

  /**
   * OffsetVal specialization for constant values
   */
  class ConstOffsetVal : public OffsetVal {
    private:
      const llvm::Constant* constant;
    public:
      ConstOffsetVal(llvm::Constant* c) : constant(c) {
        assert(c != nullptr);
      }
      bool isConst() const {return true;}
      const llvm::APInt& constVal() const;
      void print(std::ostream& stream) const;
  };

  /**
   * OffsetVal specialization for runtime-known values
   */
  class InstOffsetVal : public OffsetVal {
    private:
      const llvm::Instruction* inst;
    public:
      InstOffsetVal(llvm::Instruction* i) : inst(i) {
        assert(i != nullptr);
      }
      bool isConst() const {return false;}
      const llvm::APInt& constVal() const;
      void print(std::ostream& stream) const;
  };

  /**
   * OffsetVal specialization for unknown values, even at runtime.
   * Currently used to model while(c) {} loop iteration counts
   */
  class UnknownOffsetVal : public OffsetVal {
    private:
      const llvm::Instruction* inst;
    public:
      UnknownOffsetVal(llvm::Instruction* i) : inst(i) {
        assert(i != nullptr);
      }
      bool isConst() const {return false;}
      const llvm::APInt& constVal() const;
      void print(std::ostream& stream) const;
  };

  /**
   * OffsetVal specialization for binary compound values
   */
  enum OffsetOperator {
    Add,
    Sub,
    Mul,
    SDiv,
    UDiv,
    SRem,
    URem,
    And,
    Or,
    Xor,
    Eq,
    Neq,
    SLT,
    SLE,
    SGT,
    SGE,
    ULT,
    ULE,
    UGT,
    UGE,
    end
  };

  class BinOpOffsetVal : public OffsetVal {
    private:
      const std::string getPrintOp() const;

    public:
      const OffsetVal& lhs;
      const OffsetVal& rhs;
      const OffsetOperator op;
      BinOpOffsetVal(const OffsetVal& lhs, OffsetOperator op, const OffsetVal& rhs) : lhs(lhs), rhs(rhs), op(op) {}
      bool isConst() const;
      const llvm::APInt& constVal() const;
      void print(std::ostream& stream) const;

  };
}
#endif
