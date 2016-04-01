#/bin/bash

# http://linuxdeveloper.blogspot.hr/2012/12/building-llvm-32-from-source.html

SRC_ROOT=./llvm-source-root/
OBJ_ROOT=./llvm-build-root/


rm -fr $SRC_ROOT 
mkdir  $SRC_ROOT 
cd     $SRC_ROOT

rm -fr $OBJ_ROOT 
mkdir  $OBJ_ROOT 

# http://llvm.org/docs/GettingStarted.html

# http://lldb.llvm.org/build.html


#=============================================================================
function llvm_configure()
{
	cd $OBJ_ROOT

	#------------------------------------------------------------------
	# 1st download and upack and place the source!!!

	# Start the actual configuration and compilation of LLVM inside the 
	# build folder outside of the main source directory 
	# so as to keep the main source tree clean
	
	# NOTE:
	# The LLVM project no longer supports building with configure & make.

	# Please migrate to the CMake-based build system.
	# For more information see: http://llvm.org/docs/CMake.html
	
	#../llvm/configure --enable-shared

	# CMake will detect development environment, perform a series 
	# of tests, and generate the files required for building LLVM. 
	# CMake will use default values for all build parameters. 
	# See the Options and variables section for a list of build parameters 
	# that can be modified.

	# This can fail if CMake can’t detect your toolset, or if it thinks 
	# that the environment is not sane enough. In this case, make sure 
	# that the toolset that you intend to use is the only one reachable 
	# from the shell, and that the shell itself is the correct one for your 
	# development environment. CMake will refuse to build MinGW makefiles 
	# if you have a POSIX shell reachable through the PATH environment 
	# variable, for instance. You can force CMake to use a given build tool; 
	# for instructions, see the Usage section, below.

	cmake \
		../llvm
}
export -f llvm_configure

function llvm_build_unix_makefiles()
{
		
	#time make -j 3
	
	# After CMake has finished running, proceed to use IDE project files, 
	# or start the build from the build directory:

	# The --build option tells cmake to invoke the underlying build tool 
	# (make, ninja, xcodebuild, msbuild, etc.)

	# The underlying build tool can be invoked directly, of course, but 
	# the --build option is portable.
	cmake \
		--build \
		.

	#------------------------------------------------------------------
	
	ls -al Release+Asserts/bin
	ls -al Release+Asserts/lib

	cd ../	
}
export -f llvm_build_unix_makefiles

function llvm_build_ninja()
{
	# Using CMake + Ninja

	# Ninja is the fastest way to build LLDB! In order to use ninja, 
	# you need to have recent versions of CMake and ninja on your system. 
	# To build using ninja:

	cmake \
		-G Ninja \
		../llvm/
	ninja lldb 
	ninja check-lldb

	#Using CMake + Unix Makefiles

	# If you do not have Ninja, you can still use CMake to generate Unix 
	# Makefiles that build LLDB:

	cmake .. 
	make 
	# cmake \
	#	-G "Unix Makefiles" \
	#	../llvm/
		
	#cmake \
	#	-DCMAKE_CXX_COMPILER=/path/to/clang++ \
	#	-DCMAKE_C_COMPILER=/path/to/clang \
		
	# make
}
export -f llvm_build_ninja

function llvm_check()
{
	cd $OBJ_ROOT
	make check-all
	make check-lldb
	cd ../
}
export -f llvm_check
#=============================================================================

#=============================================================================
function download_source_git_llvm()
{
	git clone --recursive \
		http://llvm.org/git/llvm.git
	
	cd llvm/tools
	git clone --recursive \
		http://llvm.org/git/clang.git

	cd ../..
	pwd
	tree -d -L 1 ./llvm/tools/

	cd llvm/projects
	git clone \
		http://llvm.org/git/test-suite.git
	git clone \
		http://llvm.org/git/compiler-rt.git

	cd ../..
	pwd
	tree -d -L 1 ./llvm/tools/
	tree -d -L 1 ./llvm/projects/
}
export -f download_source_git_llvm

function download_source_wget_llvm()
{
	# From
	# 	http://llvm.org/releases/download.html#3.2
	# Download the latest version of
	# 	LLVM sources 
	#	including clang (C frontend) and 
	#	compiler RT from 
	wget http://llvm.org/releases/3.8.0/llvm-3.8.0.src.tar.xz
	wget http://llvm.org/releases/3.8.0/cfe-3.8.0.src.tar.xz
	wget http://llvm.org/releases/3.8.0/compiler-rt-3.8.0.src.tar.xz

	# Extract the downloaded sources
	tar xvf ./llvm-3.8.0.src.tar.xz
	tar xvf ./cfe-3.8.0.src.tar.xz
	tar xvf ./compiler-rt-3.8.0.src.tar.xz

	mv ./llvm-3.8.0.src ./llvm/	
	mv ./cfe-3.8.0.src ./clang
	mv ./compiler-rt-3.8.0.src ./compiler-rt

	mv ./clang ./llvm/tools/	
	mv ./compiler-rt ./llvm/projects/
	
	tree -d -L 1 ./llvm/tools/
	tree -d -L 1 ./llvm/projects/
	# 	|-- build (currently we are here)
	#	|-- llvm-3.8.0
	#	|   |-- projects
	#	|   |   |-- compiler-rt
	#	|   |-- tools
	#	|   |   |-- clang
	#	|-- cfe-3.8.0.src.tar.gz
	#	|-- compiler-rt-3.8.0.src.tar.gz
	#	|-- llvm-3.8.0.src.tar.gz

}
export -f download_source_wget_llvm

#download_source_git_llvm
download_source_wget_llvm
#=============================================================================

llvm_configure
llvm_build
llvm_check




#=============================================================================
function download_source_git_libcxx()
{
	cd llvm/projects

	git clone \
		http://llvm.org/git/libcxx.git
	git clone \
		http://llvm.org/git/libcxxabi.git
	# git clone \
	#	http://llvm.org/git/openmp.git

	cd ../..
	pwd
	tree -d -L 1 ./llvm/projects/
}
export -f download_source_git_libcxx

function download_source_wget_libcxx()
{
	wget http://llvm.org/releases/3.8.0/libcxx-3.8.0.src.tar.xz	
	wget http://llvm.org/releases/3.8.0/libcxxabi-3.8.0.src.tar.xz

	tar xvf ./libcxx-3.8.0.src.tar.xz	
	tar xvf ./libcxxabi-3.8.0.src.tar.xz

	mv ./libcxx-3.8.0.src ./libcxx/
	mv ./libcxxabi-3.8.0.src ./libcxxabi/

	mv ./libcxx/ ./llvm/projects/
	mv ./libcxxabi/ ./llvm/projects/	
}
export -f download_source_wget_libcxx


#download_source_git_libcxx
download_source_wget_libcxx

#=============================================================================


#=============================================================================
# http://lldb.llvm.org/build.html
function download_source_git_lldb()
{
	cd llvm/tools

	git clone \
		http://llvm.org/git/lldb.git

	cd ../..
	pwd
	tree -d -L 1 ./llvm/tools/
}
export -f download_source_git_lldb

function download_source_wget_lldb()
{
	wget http://llvm.org/releases/3.8.0/lldb-3.8.0.src.tar.xz
	tar xvf ./lldb-3.8.0.src.tar.xz
	mv ./lldb-3.8.0.src ./lldb/
	mv ./lldb ./llvm/tools/	
}
export -f download_source_wget_lldb
#=============================================================================
#download_source_git_lldb
download_source_wget_lldb


#=============================================================================
# http://lld.llvm.org/getting_started.html
function download_source_git_lld()
{
	cd llvm/tools

	git clone \
		http://llvm.org/git/lld.git

	cd ../..
	pwd
	tree -d -L 1 ./llvm/tools/
}
export -f download_source_git_lld

function download_source_wget_lld()
{
	wget http://llvm.org/releases/3.8.0/lld-3.8.0.src.tar.xz
	tar xvf ./lld-3.8.0.src.tar.xz
	mv ./lld-3.8.0.src ./lld/
	mv ./lldb ./llvm/tools/	
}
export -f download_source_wget_lld
#=============================================================================
#download_source_git_lld
download_source_wget_lld


#=============================================================================
function download_source_git_libunwind()
{
	cd llvm/projects

	git clone \
		http://llvm.org/git/libunwind.git

	cd ../..
	pwd
	tree -d -L 1 ./llvm/projects/
}
export -f download_source_git_libunwind

function download_source_wget_libunwind()
{
	wget http://llvm.org/releases/3.8.0/libunwind-3.8.0.src.tar.xz
	tar xvf ./libunwind-3.8.0.src.tar.xz
	mv ./libunwind-3.8.0.src ./libunwind/
	mv ./libunwind ./llvm/projects/	
}
export -f download_source_wget_libunwind
#=============================================================================
#download_source_git_libunwind
download_source_wget_libunwind

#=============================================================================
function download_source_git_clang_tools_extra()
{
	llvm/tools/clang/tools

	git clone \
		http://llvm.org/git/clang-tools-extra.git \
		./extra

	cd ../../../../
	pwd
	tree -d -L 1 llvm/tools/clang/tools/
}
export -f download_source_git_clang_tools_extra

function download_source_wget_clang_tools_extra()
{
	wget http://llvm.org/releases/3.8.0/clang-tools-extra-3.8.0.src.tar.xz
	tar xvf ./clang-tools-extra-3.8.0.src.tar.xz
	mv ./clang-tools-extra-3.8.0.src ./clang-tools-extra/
	mv ./clang-tools-extra/ ./llvm/tools/extra/
}
export -f download_source_wget_clang_tools_extra
#=============================================================================
#download_source_git_clang_tools_extra
download_source_wget_clang_tools_extra


function lldb_check()
{
	make check-all
}
export -f lldb_check

function llvm_compile_libcpp()
{
	echo | g++ -Wp,-v -x c++ - -fsyntax-only
	
	svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx
	mkdir build_libcxx && cd build_libcxx
	CC=clang CXX=clang++ \
		cmake \
			-G "Unix Makefiles" \
			-DLIBCXX_CXX_ABI=libsupc++ \
			-DCMAKE_BUILD_TYPE=Release \
			-DLIBCXX_LIBSUPCXX_INCLUDE_PATHS="/usr/include/c++/4.6/;/usr/include/c++/4.6/x86_64-linux-gnu/" \
			-DCMAKE_INSTALL_PREFIX=/usr \
			$HOME/Clang/libcxx
			
	cmake -G "Unix Makefiles" \
		..\
			
			
	make -j 8
	sudo make install	
}
export -f llvm_compile_libcpp

function llvm_install_global
{
	# sudo make install

	cmake --build . --target install
	
	
}
export -f llvm_install_global

function llvm_install_local_user
{
	pwd
	ls -al ./Release+Asserts/bin
	ls -al ./Release+Asserts/lib	
	
	mkdir ~/bin/llvm
	mkdir ~/bin/llvm/bin
	mkdir ~/bin/llvm/lib
	
	cp -fr \
		././Release+Asserts/bin \
		~/bin/llvm/bin
		
	cp -fr \
		././Release+Asserts/bin \
		~/bin/llvm/lib
		
	ls -al ~/bin/llv/bin	
	ls -al ~/bin/llv/lib

	echo \
		"export PATH=$PATH:~/bin/llvm/bin/"
		>> \
		~/.bashrc
	cat	~/.bashrc
	source ~/.bashrc
	
	echo \
		"~/bin/llv/lib/"
		>> \
		/etc/ld.so.conf.d/llvm.conf
	sudo ldconfig

	#check LLVM setup (binaries + libraries)
	which clang
	sudo ldconfig -p | grep LLVM	
	
	echo \
	"
		#include <stdio.h>
		int main(void)
		{
		 printf("Hello World from LLVM!\n");
		 return 0;
		}
	" >> \
		test.c
	clang test.c -o test
	./test
	rm -f test.c ./test
}
export -f llvm_install_local_user



