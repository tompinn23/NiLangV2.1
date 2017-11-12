@echo off
if defined ProgramFiles(x86) (
	echo Configuring LLVM
	cmake -G "Visual Studio 15 2017 Win64" -Thost=x64  -H./llvm -Bbuild
	echo Configuring Nilang
	cmake -H. -Bbuild
) else (
	echo Configuring LLVM
	cmake -H./llvm -Bbuild
	echo Configuring Nilang
	cmake -H. -Bbuild
)

set /p ch="Ready To Build [Y/N]"
set res=false
if %ch% == Y set res=true
if %ch% == y set res=true
if %res% == "true" (
	cmake --build build
)
@echo on