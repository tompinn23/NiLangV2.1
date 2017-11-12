@echo off
if defined ProgramFiles(x86) (
	echo Configuring LLVM
	cmake -G "Visual Studio 15 2017 Win64" -Thost=x64 -DLLVM_BUILD_TOOLS=false -DLLVM_BUILD_TESTS=false -DLLVM_INCLUDE_TESTS=false -DLLVM_BUILD_EXAMPLES=false -DLLVM_INCLUDE_EXAMPLES=false -H./llvm -Bllvm/build
	echo Configuring Nilang
	cmake -H. -Bbuild
) else (
	echo Configuring LLVM
	cmake -DLLVM_BUILD_TOOLS=false -DLLVM_BUILD_TESTS=false -DLLVM_INCLUDE_TESTS=false -DLLVM_BUILD_EXAMPLES=false -DLLVM_INCLUDE_EXAMPLES=false -H./llvm -Bbuild
	echo Configuring Nilang
	cmake -H. -Bbuild
)

cmake --build build
@echo on