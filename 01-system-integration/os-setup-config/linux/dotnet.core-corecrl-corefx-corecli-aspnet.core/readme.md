# 


## Linux Instructions

[https://github.com/dotnet/coreclr/blob/master/Documentation/building/linux-instructions.md](https://github.com/dotnet/coreclr/blob/master/Documentation/building/linux-instructions.md)

	*	cmake
	*	llvm-3.5
	*	clang-3.5
	*	lldb-3.6
	*	lldb-3.6-dev
	*	libunwind8
	*	libunwind8-dev
	*	gettext
	*	libicu-dev
	*	liblttng-ust-dev
	*	libcurl4-openssl-dev
	*	libssl-dev
	*	uuid-dev

	
## FreeBSD Instructions

[https://github.com/dotnet/coreclr/blob/master/Documentation/building/freebsd-instructions.md](https://github.com/dotnet/coreclr/blob/master/Documentation/building/freebsd-instructions.md)

	*	bash
	*	cmake
	*	llvm37 (includes LLVM 3.7, Clang 3.7 and LLDB 3.7)
	*	libunwind
	*	gettext
	*	icu

## MacOSX Instructions

[https://github.com/dotnet/coreclr/blob/master/Documentation/building/osx-instructions.md](https://github.com/dotnet/coreclr/blob/master/Documentation/building/osx-instructions.md)



## General

### LLVM compile

http://linuxdeveloper.blogspot.hr/2012/12/building-llvm-32-from-source.html
https://solarianprogrammer.com/2013/01/17/building-clang-libcpp-ubuntu-linux/
https://github.com/rsmmr/install-clang/blob/master/install-clang
http://btorpey.github.io/blog/2015/01/02/building-clang/
https://coderwall.com/p/irronw/build-llvm-clang-on-linux

### LLDB Compile

http://lldb.llvm.org/
https://llvm.org/svn/llvm-project/lldb/branches/windows/www/build.html
http://lldb.llvm.org/troubleshooting.html

*	prerequisites
	*	LLVM
	*	clang
	*	tools
		*	swig
		*	libedit
		*	python

### LLD Compile

http://lld.llvm.org/
http://lld.llvm.org/getting_started.html

*	prerequisites
	*	CMake
	*	make
		anything that CMake supports
	*	clang or gcc
		clang v >= 3.12
		gcc v >= 4.7
		c++ v.11 support - mandatory
		libc++ for clang

		
Get the required tools.
CMake 2.8+.
make (or any build system CMake supports).
Clang 3.1+ or GCC 4.7+ (C++11 support is required).
If using Clang, you will also need libc++.
Python 2.4+ (not 3.x) for running tests.
Check out LLVM:

$ cd path/to/llvm-project
$ svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
Check out lld:

$ cd llvm/tools
$ svn co http://llvm.org/svn/llvm-project/lld/trunk lld
lld can also be checked out to path/to/llvm-project and built as an external project.
Build LLVM and lld:

$ cd path/to/llvm-build/llvm (out of source build required)
$ cmake -G "Unix Makefiles" path/to/llvm-project/llvm
$ make
If you want to build with clang and it is not the default compiler or it is installed in an alternate location, you’ll need to tell the cmake tool the location of the C and C++ compiler via CMAKE_C_COMPILER and CMAKE_CXX_COMPILER. For example:

$ cmake -DCMAKE_CXX_COMPILER=/path/to/clang++ -DCMAKE_C_COMPILER=/path/to/clang ...
Test:

$ make check-lld		
		
		
### Unwind

	http://download.savannah.gnu.org/releases/libunwind/libunwind-1.1.tar.gz
	

	