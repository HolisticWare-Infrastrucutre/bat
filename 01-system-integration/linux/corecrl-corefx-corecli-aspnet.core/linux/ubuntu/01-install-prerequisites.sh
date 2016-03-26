#/bin/bash

install_prerequisites

function install_prerequisites()
{
	PACKAGE_MANAGER=apt-get

	sudo $PACKAGE_MANAGER install -y \
		git

	# Install required dependencies 
	sudo $PACKAGE_MANAGER install -y \
		tree

	sudo $PACKAGE_MANAGER install -y \
		build-essential \

	# build-essential equivalent
	sudo $PACKAGE_MANAGER install -y \
		dpkg-dev \
		gcc \
		g++ \
		make \
		libc-dev \		
		libc6-dev \
		libc6 \
		libc6-dev-sparc64 \
		libc6.1-dev \

	git config --global user.name  \
		"moljac"
	git config --global user.email \
		"mcvjetko@holisicware.net"

	git clone --recursive https://github.com/moljac/bat.git

}

function llvm_get()
{
	mkdir 	~/llvm
	cd 	~/llvm

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
	
	# Once everything is in place we create a separate folder for the build process
	mkdir ./build
	cd ./build

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
}

function llvm_check()
{
	make check-all
}