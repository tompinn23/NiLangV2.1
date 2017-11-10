cmake_minimum_required(VERSION 3.0)
cmake_minimum_required (VERSION 3.0 FATAL_ERROR)

project (NILANG VERSION 0.1.0)

set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/build)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})


add_executable(nilang ${NILANG_SOURCE_DIR}/main.cc)