
#include "llvm/IR/Function.h"

#ifndef GPU_UTILS_H
#define GPU_UTILS_H

using namespace llvm;

namespace gpucheck {
  extern bool isKernelFunction(const Function& F);
}

#endif
