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
class BugEmitter {
  static void emitWarning(string warning, Instruction* i) {
    DILocation *Loc = i->getDebugLoc();
    if(!Loc) {
      errs() << "in function " << i->getParent()->getParent()->getName() << ":\n";
      errs() << "-Warning: " << warning << "\n";
      i->dump();
      errs() << "\n";
    } else {
      errs() << Loc->getFilename() << ":" << Loc->getLine() << " in function " << i->getParent()->getParent()->getName() << ":\n";
      errs() << "-Warning: " << warning << "\n";
      //TODO: Write out the source line of code
    }
  }
};
