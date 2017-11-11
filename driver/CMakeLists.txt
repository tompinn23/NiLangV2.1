add_executable(nilang main.cc)
add_dependencies(nilang NilangAST NilangCodegen)