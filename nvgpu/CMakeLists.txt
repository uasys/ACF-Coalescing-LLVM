add_library(GpuAnalysis MODULE ThreadDepAnalysis.cpp
                               ThreadValueAnalysis.cpp
                               BranchDivergeAnalysis.cpp
                               MemCoalesceAnalysis.cpp
                               BugEmitter.cpp
                               Utilities.cpp)
