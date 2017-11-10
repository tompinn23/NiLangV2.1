import sys
if sys.version_info <= (3,0):
	print("Sorry this requires Python 3")
	sys.exit(0)

import os
import tarfile
import lzma
import urllib.request
import io
from subprocess import Popen, PIPE
import platform
from waflib import Logs
WIN64 = 'PROGRAMFILES(X86)' in os.environ

top = '.'
out = 'build'

def get_file_progress_file_object_class(on_progress):
	class FileProgressFileObject(tarfile.ExFileObject):
		def read(self, size, *args):
		  on_progress(self.name, self.position, self.size)
		  return tarfile.ExFileObject.read(self, size, *args)
	return FileProgressFileObject

class TestFileProgressFileObject(tarfile.ExFileObject):
	def read(self, size, *args):
	  on_progress(self.name, self.position, self.size)
	  return tarfile.ExFileObject.read(self, size, *args)

class ProgressFileObject(io.FileIO):
	def __init__(self, path, *args, **kwargs):
		self._total_size = os.path.getsize(path)
		io.FileIO.__init__(self, path, *args, **kwargs)

	def read(self, size):
		numOfChars = int((self.tell() / self._total_size) * 40)
		space = 40 - (numOfChars + 1)
		string = '[' + ''.join(['#'] * (numOfChars + 1)) + ''.join([' '] * space)+ ']' + ' ' + str(int((self.tell() / self._total_size) * 100) + 1) + '%'
		print(string, end='\r')
		return io.FileIO.read(self, size)

def on_progress(filename, position, total_size):
	print("%s: %d of %s" %(filename, position, total_size))


def options(opt):
	opt.add_option('--auto', action='store_true', help="Attempt to do everything for you")

def configure(cnf):
	print(cnf.root.find_node('msbuild.exe'))
	cnf.env.AUTO = cnf.options.auto
	if cnf.env.AUTO == []: cnf.env.AUTO = False
	
	if cnf.env.AUTO:
		configure_auto(cnf)
	else:
		configure_man(cnf)
		
def configure_auto(cnf):
	llvm = urllib.request.urlopen("http://releases.llvm.org/5.0.0/llvm-5.0.0.src.tar.xz")
	if not os.path.isfile("llvm.tar.xz"):
		print("Downloading LLVM 5.0.0")
		with open("llvm.tar.xz", "wb") as f:
			f.write(llvm.read())
	if not os.path.isdir("./build/llvm-5.0.0.src"):
		print("Extracting LLVM")
		tarfile.TarFile.fileobject = get_file_progress_file_object_class(on_progress)
		with tarfile.open(fileobj=ProgressFileObject("llvm.tar.xz")) as f:
			f.extractall('./build')
		print('[' + ''.join(['#'] * 40) + ']' + ' ' + str(100) + '%')
	

def try_find_cmake_win():
	if os.path.isfile("C:\\Program Files\\CMake\\bin\cmake.exe"): return "C:\\Program Files\\CMake\\bin\cmake.exe"
	elif os.path.isfile("C:\\Program Files (x86)\\CMake\\bin\cmake.exe"): return "C:\\Program Files\\CMake\\bin\cmake.exe"
	elif os.path.isfile("C:\\CMake\\bin\cmake.exe"): return "C:\\CMake\\bin\cmake.exe"
	else:
		print("Oops! Couldn't find cmake please enter the path to the cmake executable")
		path = input()
		if path[-3:].lower() != 'exe':
			if path[-1] == '\\':
				path += 'cmake.exe'
			else:
				path += '\\cmake.exe'
		return path
		
		
def configure_man(cnf): 
	print("Where are the llvm libs.")
	LLVMlibs = input()
	print("Where are the llvm header files.")


def build_llvm():
	oldcwd = os.getcwd()
	os.chdir('./build/llvm-5.0.0.src')
	Logs.pprint('YELLOW', "NOT WAF: I'm entering: " + os.getcwd() + " don't tell waf")
	if platform.system() == "Windows":
		path = try_find_cmake_win()
		if WIN64:
			cmd = [path, "-G", "Visual Studio 15 2017 Win64", "-Thost=x64", "."]
		else:
			cmd = [path, "-G", "Visual Studio 15 2017","."]
		with Popen(cmd, stdout=PIPE, bufsize=1, universal_newlines=True) as p:
			for line in p.stdout:
				print(line, end='')	
	os.chdir(oldcwd)
def build(bld):
	build_llvm()