#include "OffsetPropagation.h"
#include "OffsetOps.h"
#include "raw_os_ostream.h"

namespace gpucheck {
  /************************************************
   * OffsetVal
   ************************************************/
  void OffsetVal::print(std::ostream& os) const {
    os << "<ERROR BaseClass print>>";
  }
  const llvm::APInt& OffsetVal::constVal() const {
    assert(false);
  }

  bool OffsetVal::isConst() const {
    assert(false);
  }

  /************************************************
   * ConstOffsetVal
   ************************************************/
  void ConstOffsetVal::print(std::ostream& os) const {
    llvm::raw_os_ostream ros(os);
    ros << this->intVal;
  }
  const llvm::APInt& ConstOffsetVal::constVal() const {
    return this->intVal;
  }

  /************************************************
   * InstOffsetVal
   ************************************************/
  void InstOffsetVal::print(std::ostream& os) const {
    llvm::raw_os_ostream ros(os);
    this->inst->printAsOperand(ros, true, this->inst->getModule());
  }
  const llvm::APInt& InstOffsetVal::constVal() const {
    assert(false);
  }

  /************************************************
   * ArgOffsetVal
   ************************************************/
  void ArgOffsetVal::print(std::ostream& os) const {
    llvm::raw_os_ostream ros(os);
    this->arg->printAsOperand(ros, true, this->arg->getParent()->getParent());
  }
  const llvm::APInt& ArgOffsetVal::constVal() const {
    assert(false);
  }

  /************************************************
   * UnknownOffsetVal
   ************************************************/
  void UnknownOffsetVal::print(std::ostream& os) const {
    os << "(unknown on ";
    llvm::raw_os_ostream ros(os);
    this->inst->printAsOperand(ros, false, this->inst->getModule());
    os << ')';
  }
  const llvm::APInt& UnknownOffsetVal::constVal() const {
    assert(false);
  }

  /************************************************
   * BinOpOffsetVal
   ************************************************/
  const std::string BinOpOffsetVal::getPrintOp() const {
    switch(op) {
      case OffsetOperator::Add: return "+";
      case OffsetOperator::Sub: return "-";
      case OffsetOperator::Mul: return "*";
      case OffsetOperator::SDiv:
      case OffsetOperator::UDiv: return "/";
      case OffsetOperator::SRem:
      case OffsetOperator::URem: return "%";
      case OffsetOperator::And: return "&&";
      case OffsetOperator::Or: return "||";
      case OffsetOperator::Xor: return "^";
      case OffsetOperator::Eq: return "==";
      case OffsetOperator::Neq: return "!=";
      case OffsetOperator::SLT:
      case OffsetOperator::ULT: return "<";
      case OffsetOperator::SLE:
      case OffsetOperator::ULE: return "<=";
      case OffsetOperator::SGT:
      case OffsetOperator::UGT: return ">";
      case OffsetOperator::SGE:
      case OffsetOperator::UGE: return ">=";
      case OffsetOperator::end: assert(false);
    }
  }

  void BinOpOffsetVal::print(std::ostream& os) const {
    os << '(' << *lhs << ' ' << getPrintOp() << ' ' << *rhs << ')';
  }
  bool BinOpOffsetVal::isConst() const {
    return false;
  }
  const llvm::APInt& BinOpOffsetVal::constVal() const {
    assert(false);
  }
}
