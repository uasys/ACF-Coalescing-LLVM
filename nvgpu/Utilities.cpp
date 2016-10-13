#include "llvm/IR/Module.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "Utilities.h"

bool gpucheck::isKernelFunction(const Function &F) {
    NamedMDNode *NMD = F.getParent()->getNamedMetadata("nvvm.annotations");
    if(NMD) {
      for(auto n=NMD->op_begin(),e=NMD->op_end(); n!=e; ++n) {
        if((*n)->getNumOperands() > 2)
          if(auto str = dyn_cast<MDString>((*n)->getOperand(1))) {
            if(str->getString() == "kernel") {
              const Function *k = mdconst::dyn_extract_or_null<Function>((*n)->getOperand(0));
              if(&F == k)
                return true;
            }
          }
      }
    }
    return F.getCallingConv() == CallingConv::PTX_Kernel;
}
