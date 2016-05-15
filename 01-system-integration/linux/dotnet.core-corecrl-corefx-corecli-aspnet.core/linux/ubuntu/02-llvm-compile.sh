#/bin/bash

llvm_download_source_wget
llvm_compile
llvm_check
llvm_install_global

# http://linuxdeveloper.blogspot.hr/2012/12/building-llvm-32-from-source.html

function llvm_download_source_wget()
{
	mkdir 	~/llvm-moljac
	cd 		~/llvm-moljac

	rm -fr build/ 
	rm -fr llvm*/ 
	rm -fr *.tar.gz *.tar.xz

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

	mv ./llvm-3.8.0.src ./llvm-3.8.0
	mv ./cfe-3.8.0.src ./clang
	mv ./clang ./llvm-3.8.0/tools/
	mv ./compiler-rt-3.8.0.src ./compiler-rt
	mv ./compiler-rt ./llvm-3.8.0/projects/
	
	tree -d -L 1 ../llvm-3.8.0/tools/
	tree -d -L 1 ../llvm-3.8.0/projects/
	# 	|-- build (currently we are here)
	#	|-- llvm-3.8.0
	#	|   |-- projects
	#	|   |   |-- compiler-rt
	#	|   |-- tools
	#	|   |   |-- clang
	#	|-- cfe-3.8.0.src.tar.gz
	#	|-- compiler-rt-3.8.0.src.tar.gz
	#	|-- llvm-3.8.0.src.tar.gz

	#-------------------------------------------------------
	wget http://llvm.org/releases/3.8.0/libcxx-3.8.0.src.tar.xz	
	wget http://llvm.org/releases/3.8.0/libcxxabi-3.8.0.src.tar.xz
	wget http://llvm.org/releases/3.8.0/libunwind-3.8.0.src.tar.xz
	wget http://llvm.org/releases/3.8.0/lld-3.8.0.src.tar.xz
	wget http://llvm.org/releases/3.8.0/lldb-3.8.0.src.tar.xz
	wget http://llvm.org/releases/3.8.0/clang-tools-extra-3.8.0.src.tar.xz
	
	# Extract the downloaded sources
	tar xvf ./libcxx-3.8.0.src.tar.xz	
	tar xvf ./libcxxabi-3.8.0.src.tar.xz
	tar xvf ./libunwind-3.8.0.src.tar.xz
	tar xvf ./lld-3.8.0.src.tar.xz
	tar xvf ./lldb-3.8.0.src.tar.xz
	tar xvf ./clang-tools-extra-3.8.0.src.tar.xz
	
	mv ./libcxx-3.8.0.src.tar.xz ./libcxx/
	mc ./libcxx/ ./llvm-3.8.0/projects/
	mv ./libcxx-3.8.0.src.tar.xz ./libcxxabi/
	mc ./libcxxabi/ ./llvm-3.8.0/projects/
	
	mv ./clang-tools-extra-3.8.0.src.tar.xz ./clang-tools-extra/
	mv ./clang-tools-extra/ ./llvm-3.8.0/tools/extra/
	
	mv ./libunwind-3.8.0.src.tar.xz ./libunwind/
	mv ./lld-3.8.0.src.tar.xz ./lld/
	mv ./lldb-3.8.0.src.tar.xz ./lldb/
	
	
	# source is in place - create build folder
	mkdir ./build
	cd ./build

	# Note : There are various configuration flags 
	#	for CPU architecture, 
	#	optimize builds, 
	#	threads, etc. 
	../llvm-3.8.0/configure --help
	
}

function llvm_compile()
{
	# Now we start the actual configuration and compilation of LLVM 
	# inside the 'build' folder outside of the main source directory 
	# so as to keep the main source tree clean
	../llvm-3.8.0/configure --enable-shared

	time make -j 3
	
	ls -al Release+Asserts/bin
	ls -al Release+Asserts/lib	
}

function llvm_check()
{
	make check-all
}

function llvm_compile_libcpp()
{
	echo | g++ -Wp,-v -x c++ - -fsyntax-only
	
	svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx
	mkdir build_libcxx && cd build_libcxx
	CC=clang CXX=clang++ cmake -G "Unix Makefiles" -DLIBCXX_CXX_ABI=libsupc++ -DLIBCXX_LIBSUPCXX_INCLUDE_PATHS="/usr/include/c++/4.6/;/usr/include/c++/4.6/x86_64-linux-gnu/" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr $HOME/Clang/libcxx
	make -j 8
	sudo make install	
}

function llvm_install_global
{
	sudo make install
}

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

