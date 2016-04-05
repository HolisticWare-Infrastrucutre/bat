#/bin/bash

export 	VERSION=3.8.0

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
function llvm_configure_unix_makefiles()
{
	cd $OBJ_ROOT

	#------------------------------------------------------------------
	# 1st download and upack and place the source!!!

	# Start the actual configuration and compilation of LLVM inside the 
	# build folder outside of the main source directory 
	# so as to keep the main source tree clean
	
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

	# If Ninja build is not installed, use CMake to generate Unix Makefiles 
	# that build LLVM and LLDB:

	cmake \
		-G "Unix Makefiles" \
		../llvm

}
export -f llvm_configure_unix_makefiles


function llvm_configure_ninja()
{
	cmake \
		-G "UnixNinja" \
		../llvm
}
export -f llvm_configure_ninja

function llvm_configure_autoconf()
{
	# NOTE:
	# The LLVM project no longer supports building with configure & make.

	# Please migrate to the CMake-based build system.
	# For more information see: http://llvm.org/docs/CMake.html
	
	# To build with autoconf

	# CMake is not installed , it is still possible to build LLVM and LLDB 
	# using the autoconf build system. 
	# Clang or GCC 4.8+, 
	# run:
	# generates unix makefiles
	

	# run configure with
	# 	-enable-libcpp
	# 	to build with libc++ instead of libstdc++ (the default)
	#	--enable-optimized
	#	to build a release version of LLDB
	# 	--enable-shared

	# building with a GCC that isn't the default gcc/g++, like gcc-4.9/g++-4.9

	#../llvm/configure \
	#	CC=gcc-4.9 \
	#	CXX=g++-4.9 \

	../llvm/configure \
		--enable-shared
}
export -f llvm_configure_autoconf

function llvm_build_unix_makefiles()
{
	# After CMake has finished running, proceed to use IDE project files, 
	# or start the build from the build directory:

	# The --build option tells cmake to invoke the underlying build tool 
	# (make, ninja, xcodebuild, msbuild, etc.)

	# The underlying build tool can be invoked directly, of course, but 
	# the --build option is portable.

	cmake \
		--build \
		./

	# time \
	#	make -j 3	
	# make \
	#	CC=gcc-4.9 \
	#	CXX=g++-4.9
	#------------------------------------------------------------------
	
	# running in a system that doesn't have a lot of RAM (less than 4GB), 
	# disable debug symbols by specifying 
	#	DEBUG_SYMBOLS=0 when running make. 
	# enable this if build fails to link clang 
	# (the linker will get a SIGKILL and exit with status 9).

	# make DEBUG_SYMBOLS=0

	# Note that once both LLVM and Clang have been configured and built 
	# it is not necessary to perform a top-level make to rebuild changes 
	# made only to LLDB. 
	# run make from the build/tools/lldb subdirectory
	# To run the LLDB test suite, run:

	make -C tools/lldb/test

	ls -al Release+Asserts/bin
	ls -al Release+Asserts/lib
}
export -f llvm_build_unix_makefiles


function llvm_build_ninja()
{
	# Using CMake + Ninja

	# Ninja is the fastest way to build LLDB! 
	# use recent versions of CMake and ninja 

	ninja lldb 
	ninja check-lldb

	#Using CMake + Unix Makefiles

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
	if [ !-d "llvm" ] ;
	then
		git clone --recursive \
			http://llvm.org/git/llvm.git
	fi
	
	cd llvm/tools
	if [ ! -d "clang" ] ;
	  then
		git clone --recursive \
			http://llvm.org/git/clang.git
	fi
	cd ../..
	pwd
	tree -d -L 1 ./llvm/tools/

	cd llvm/projects
	if [ ! -d "compiler-rt" ] ;
	  then
		git clone \
			http://llvm.org/git/compiler-rt.git
	fi
	if [ ! -d "test-suite" ] ;
	  then
		git clone \
			http://llvm.org/git/test-suite.git
	fi

	cd ../..
	pwd
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

	#................................................................
	FILE=llvm-$VERSION.src.tar.xz
	if [ ! -f "$FILE" ];
	  then
		wget http://llvm.org/releases/$VERSION/$FILE
	fi
	if [ ! -f "$FILE" ];
	  then
		tar xvf $FILE
	fi
	if [ ! -d "./llvm/" ];
	  then
		mv ./llvm-$VERSION.src ./llvm/	
	fi

	#................................................................
	FILE=cfe-$VERSION.src.tar.xz
	if [ ! -f "$FILE" ];
	  then
		wget http://llvm.org/releases/$VERSION/$FILE
	fi
	if [ ! -f "$FILE" ];
	  then
		tar xvf $FILE
	fi
	if [ ! -d "./cfe-$VRESION.src/" ];
	  then
		mv ./cfe-$VRESION.src/ ./clang
	fi
	if [ ! -d "./llvm/tools/" ];
	  then
		mkdir ./llvm/tools/
	fi
	mv ./clang/ ./llvm/tools/	
 
	#................................................................
	FILE=compiler-rt-$VERSION.src.tar.xz
	if [ ! -f "$FILE" ];
	  then
		wget http://llvm.org/releases/$VERSION/$FILE
	fi
	if [ ! -f "$FILE" ];
	  then
		tar xvf $FILE
	fi
	if [ ! -d "./compiler-rt-$VERSION.src/" ];
	  then
		mv ./compiler-rt-$VERSION.src/ ./compiler-rt/
	fi
	if [ ! -d "./llvm/projects/" ];
	  then
		mkdir ./llvm/projects/
	fi
	mv ./compiler-rt/ ./llvm/projects/

	#................................................................
	FILE=test-suite-$VERSION.src.tar.xz
	if [ ! -f "$FILE" ];
	  then
		wget http://llvm.org/releases/$VERSION/$FILE
	fi
	if [ ! -f "$FILE" ];
	  then
		tar xvf $FILE
	fi
	if [ ! -d "./test-suite-$VERSION.src/" ];
	  then
		mv ./test-suite-$VERSION.src/ ./test-suite/
	fi
	if [ ! -d "./llvm/projects/" ];
	  then
		mkdir ./llvm/projects/
	fi
	mv ./test-suite/ ./llvm/projects/
}
export -f download_source_wget_llvm
#=============================================================================


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
}
export -f download_source_git_libcxx

function download_source_wget_libcxx()
{
	#................................................................
	FILE=libcxx-$VERSION.src.tar.xz
	if [ ! -f "$FILE" ];
	  then
		wget http://llvm.org/releases/$VERSION/$FILE
	fi
	if [ ! -f "$FILE" ];
	  then
		tar xvf $FILE
	fi
	if [ ! -d "./libcxx-$VERSION.src/" ];
	  then
		mv ./libcxx-$VERSION.src/ ./libcxx/
	fi
	if [ ! -d "./llvm/projects/" ];
	  then
		mkdir ./llvm/projects/
	fi
	mv ./libcxx/ ./llvm/projects/

	#................................................................
	FILE=libcxxabi-$VERSION.src.tar.xz
	if [ ! -f "$FILE" ];
	  then
		wget http://llvm.org/releases/$VERSION/$FILE
	fi
	if [ ! -f "$FILE" ];
	  then
		tar xvf $FILE
	fi
	if [ ! -d "./libcxxabi-$VERSION.src/" ];
	  then
		mv ./libcxxabi-$VERSION.src/ ./libcxxabi/
	fi
	if [ ! -d "./llvm/projects/" ];
	  then
		mkdir ./llvm/projects/
	fi
	mv ./libcxxabi/ ./llvm/projects/

}
export -f download_source_wget_libcxx
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
}
export -f download_source_git_lldb

function download_source_wget_lldb()
{
	#................................................................
	FILE=lldb-$VERSION.src.tar.xz
	if [ ! -f "$FILE" ];
	  then
		wget http://llvm.org/releases/$VERSION/$FILE
	fi
	if [ ! -f "$FILE" ];
	  then
		tar xvf $FILE
	fi
	if [ ! -d "./lldb-$VERSION.src/" ];
	  then
		mv ./lldb-$VERSION.src/ ./lldb/
	fi
	if [ ! -d "./llvm/tools/" ];
	  then
		mkdir ./llvm/tools/
	fi
	mv ./lldb/ ./llvm/tools/
}
export -f download_source_wget_lldb
#=============================================================================


#=============================================================================
# http://lld.llvm.org/getting_started.html
function download_source_git_lld()
{
	cd llvm/tools

	git clone \
		http://llvm.org/git/lld.git

	cd ../..
	pwd
}
export -f download_source_git_lld

function download_source_wget_lld()
{
	#................................................................
	FILE=lld-$VERSION.src.tar.xz
	if [ ! -f "$FILE" ];
	  then
		wget http://llvm.org/releases/$VERSION/$FILE
	fi
	if [ ! -f "$FILE" ];
	  then
		tar xvf $FILE
	fi
	if [ ! -d "./lld-$VERSION.src/" ];
	  then
		mv ./lld-$VERSION.src/ ./lld/
	fi
	if [ ! -d "./llvm/tools/" ];
	  then
		mkdir ./lld/tools/
	fi
	mv ./lld/ ./lld/tools/
}
export -f download_source_wget_lld
#=============================================================================

#=============================================================================
function download_source_git_libunwind()
{
	cd llvm/projects

	git clone \
		http://llvm.org/git/libunwind.git

	cd ../..
	pwd
}
export -f download_source_git_libunwind

function download_source_wget_libunwind()
{
	#................................................................
	FILE=libunwind-$VERSION.src.tar.xz
	if [ ! -f "$FILE" ];
	  then
		wget http://llvm.org/releases/$VERSION/$FILE
	fi
	if [ ! -f "$FILE" ];
	  then
		tar xvf $FILE
	fi
	if [ ! -d "./libunwind-$VERSION.src/" ];
	  then
		mv ./libunwind-$VERSION.src/ ./lld/
	fi
	if [ ! -d "./libunwind/projects/" ];
	  then
		mkdir ./libunwind/projects/
	fi
	mv ./libunwind/ ./libunwind/projects/
}
export -f download_source_wget_libunwind
#=============================================================================

#=============================================================================
function download_source_git_clang_tools_extra()
{
	llvm/tools/clang/tools

	git clone \
		http://llvm.org/git/clang-tools-extra.git \
		./extra

	cd ../../../../
	pwd
}
export -f download_source_git_clang_tools_extra

function download_source_wget_clang_tools_extra()
{
	#................................................................
	FILE=clang-tools-extra-$VERSION.src.tar.xz
	if [ ! -f "$FILE" ];
	  then
		wget http://llvm.org/releases/$VERSION/$FILE
	fi
	if [ ! -f "$FILE" ];
	  then
		tar xvf $FILE
	fi
	if [ ! -d "./clang-tools-extra-$VERSION.src/" ];
	  then
		mv ./clang-tools-extra-$VERSION.src/ ./extra/
	fi
	if [ ! -d "./llvm/tools/" ];
	  then
		mkdir ./llvm/tools/
	fi
	mv ./extra/ ./llvm/tools/
}
export -f download_source_wget_clang_tools_extra
#=============================================================================






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








#download_source_git_llvm
download_source_wget_llvm

#download_source_git_lldb
download_source_wget_lldb

#download_source_git_lld
download_source_wget_lld

#download_source_git_clang_tools_extra
download_source_wget_clang_tools_extra

#download_source_git_libcxx
download_source_wget_libcxx

#download_source_git_libunwind
#download_source_wget_libunwind


tree -d -L 3 ./

# 	|-- llvm-build-root
#	|-- llvm
#	|   |-- projects
#	|   |   |-- compiler-rt
#	|   |-- tools
#	|   |   |-- clang
#	|-- cfe-3.8.0.src.tar.gz
#	|-- compiler-rt-3.8.0.src.tar.gz
#	|-- llvm-3.8.0.src.tar.gz



tree -d -L 1 ./llvm/tools/
tree -d -L 1 ./llvm/projects/

#llvm_configure_unix_makefiles
#llvm_build_unix_makefiles


#llvm_configure_ninja
#llvm_build_ninja

llvm_check


