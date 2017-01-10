#include "OffsetPropagation.h"
#include "llvm/Support/raw_os_ostream.h"

namespace gpucheck {

  /************************************************
   * ConstOffsetVal
   ************************************************/
  void ConstOffsetVal::print(std::ostream& os) const {
    os << this->constant;
  }
  const llvm::APInt& ConstOffsetVal::constVal() const {
    return this->constant->getUniqueInteger();
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
      case OffsetOperator::Mod: return "%";
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
    }
  }

  void BinOpOffsetVal::print(std::ostream& os) const {
    os << '(' << lhs << ' ' << getPrintOp() << ' ' << rhs << ')';
  }
  bool BinOpOffsetVal::isConst() const {
    return lhs.isConst() && rhs.isConst();
  }
  const llvm::APInt& BinOpOffsetVal::constVal() const {
    assert(false);
  }
}
