#include "llvm/Support/Debug.h"
#include "llvm/Support/raw_ostream.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Instruction.h"
#include "llvm/IR/Instructions.h"


#include "BranchDivergeAnalysis.h"
#include "BugEmitter.h"
#include "Utilities.h"

using namespace std;
using namespace llvm;
using namespace gpucheck;

#define DEBUG_TYPE "bdiverge"

#define DIVERGE_THRESH 0.2f

bool BranchDivergeAnalysis::runOnModule(Module &M) {
  TD = &getAnalysis<ThreadDependence>();
  TV = &getAnalysis<ThreadValueAnalysis>();
  // Run over each kernel function
  for(auto f=M.begin(), e=M.end(); f!=e; ++f) {
    if(!f->isDeclaration()) {
      runOnKernel(*f);
    }
  }
  return false;
}

bool BranchDivergeAnalysis::runOnKernel(Function &F) {
  for(auto b=F.begin(),e=F.end(); b!=e; ++b) {

    for(auto i=b->begin(),e=b->end(); i!=e; ++i) {
      if(auto B=dyn_cast<BranchInst>(i)) {
        if(B->isConditional() && TD->isDependent(B)) {
          // We've found a potentially divergent branch!
          // TODO: Determine if branch is high-cost
          float divergence = getDivergence(B);
          if(divergence > DIVERGE_THRESH) {
            emitWarning("Divergent Branch Detected", B, SEV_MED);
            DEBUG(
              errs() << "Found Divergent Branch!! diverge=(" << divergence << ")\n";
              B->dump();
              errs() << "\n\n";
            );
          } else {
            DEBUG(
              errs() << "Nondivergent branch, diverge=(" << divergence << ")\n";
              B->dump();
              errs() << "\n\n";
            );
          }
        }
      }
    }
  }
  return false;
}

float BranchDivergeAnalysis::getDivergence(BranchInst *BI) {
  assert(BI->isConditional());
  // Special-case boundary checks
  if(auto CMP=dyn_cast<CmpInst>(BI->getCondition())) {
    if(isBoundaryCheck(CMP))
      return 1.0/32.0f; // can only flip once!
  }

  int divergent = 0;
  for(int warp=0; warp<32; warp++) {
    APInt *out = TV->evaluateForThreadIdx(BI->getCondition(), warp*32);
    if(out == nullptr) {
      divergent++;
      continue;
    }
    for(int tid=1; tid<32; tid++) {
      APInt *next = TV->evaluateForThreadIdx(BI->getCondition(), warp*32+tid);
      if(next == nullptr) {
        divergent++;
        break;
      }
      if(!next->eq(*out)) {
        divergent++;
        delete next;
        break;
      }
    }
    delete out;
  }
  return divergent/32.0f;
}

bool BranchDivergeAnalysis::isBoundaryCheck(CmpInst *CI) {
  // Directional comparison
  switch(CI->getPredicate()) {
    case CmpInst::ICMP_SLE:
    case CmpInst::ICMP_SLT:
    case CmpInst::ICMP_SGE:
    case CmpInst::ICMP_SGT:
    case CmpInst::ICMP_ULE:
    case CmpInst::ICMP_ULT:
    case CmpInst::ICMP_UGE:
    case CmpInst::ICMP_UGT:
      break;
    default:
      return false;
  }
  Value *td;
  // Only a single thread-dependent value
  if(TD->isDependent(CI->getOperand(0)) && !TD->isDependent(CI->getOperand(1))) {
    td = CI->getOperand(0);
  } else if(!TD->isDependent(CI->getOperand(0)) && TD->isDependent(CI->getOperand(1))) {
    td = CI->getOperand(1);
  } else {
    return false;
  }

  // The thread-dependent value must be ascending or descending
  bool ascending = true;
  bool descending = true;

  APInt *last = TV->threadDepPortion(td, 0);
  if(!last)
    return false; // Not evaluatable

  for(int tid = 1; tid<256; tid++) {
    if(!ascending && !descending)
      break;

    APInt *val = TV->threadDepPortion(td, tid);
    if(!val)
      return false;

    ascending &= last->slt(*val);
    descending &= last->sgt(*val);
    delete last;
    last = val;
  }

  delete last;
  return ascending || descending;
}

char BranchDivergeAnalysis::ID = 0;
static RegisterPass<BranchDivergeAnalysis> X("bdiverge", "Locate divergent branches in GPU code",
                                        false,
                                        true);

#undef DEBUG_TYPE
