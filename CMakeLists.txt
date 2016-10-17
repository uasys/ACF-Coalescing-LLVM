cmake_minimum_required(VERSION 3.5)
find_package(LLVM REQUIRED CONFIG)

set (CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti -g")

add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})

add_library(wali SHARED IMPORTED)
include_directories("${CMAKE_SOURCE_DIR}/wali-opennwa-4.1/Source/")

add_subdirectory(nvgpu)

