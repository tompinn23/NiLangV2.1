cmake_minimum_required(VERSION 3.0)
cmake_minimum_required (VERSION 3.0 FATAL_ERROR)

project (NILANG VERSION 0.1.0)

set(NILANG_MAIN_INCLUDE_DIR ${CMAKE_SOURCE_DIR}/include CACHE STRING "The top level include directory")
set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/build)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(LIBRARY_OUTPUT_PATH ${CMAKE_BINARY_DIR})
set(LLVM_INCLUDE_DIR "C:\\LLVM\\include")
set( CMAKE_EXPORT_COMPILE_COMMANDS ON )

IF( EXISTS "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json" )
  EXECUTE_PROCESS( COMMAND ${CMAKE_COMMAND} -E copy_if_different
    ${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json
    ${CMAKE_CURRENT_SOURCE_DIR}/compile_commands.json
  )
ENDIF()

include_directories(${NILANG_MAIN_INCLUDE_DIR} ${LLVM_INCLUDE_DIR})

add_subdirectory(ast)
add_subdirectory(codegen)
add_subdirectory(driver)
add_subdirectory(parsing)


