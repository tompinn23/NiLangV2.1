add_executable(nilang main.cc)
add_dependencies(nilang NilangAST NilangCodegen)
llvm_map_components_to_libnames(llvm_libs all)
target_link_libraries(nilang ${llvm_libs})