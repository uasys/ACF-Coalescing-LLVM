#include "llvm/IR/Instruction.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#include <iostream>
#include <string>

using namespace llvm;
using namespace std;

namespace gpucheck {
  extern void emitWarning(string warning, Instruction* i);
}
