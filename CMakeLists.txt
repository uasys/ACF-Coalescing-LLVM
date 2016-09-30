cmake_minimum_required(VERSION 3.5)
find_package(LLVM REQUIRED CONFIG)

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})

add_library(wali SHARED IMPORTED)
include_directories("./wali-opennwa-4.1/lib64")

add_subdirectory(nvgpu)
