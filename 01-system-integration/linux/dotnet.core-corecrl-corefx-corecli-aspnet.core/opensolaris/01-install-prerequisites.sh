#/bin/bash

install_prerequisites

function install_prerequisites()
{
	PACKAGE_MANAGER=/opt/csw/bin/pkgutil

	pkgadd -d http://get.opencsw.org/now
	
	sudo $PACKAGE_MANAGER -U
	sudo $PACKAGE_MANAGER -y -i \
			xz \
			wget \
			curl \
			git \
			git_doc \
			git_completion \
			git_emacs \
			git_gui \
			git_subtree \
			gmake \
			cmake \
			libicudata56 \
			libicui18n56 \
			libicuio56 \
			libicule56 \
			libiculx56 \
			libicutest56 \
			libicutu56 \
			libicuuc56 \
			libicu_dev \
			libssl1_0_0 \
			libssl3 \
			libssl_dev \
			ggettext \
			ggettextdoc \
			ggettexttrt \
			ggettext_data \
			ggettext_dev \
			libgettextlib0_18_1 \
			libgettextsrc0_18_1 \
			swig \
			python\
			gcc4core \
			gcc4g++ \
			gcc5core \
			gcc5g++ \
			tree \
			
	/usr/sbin/pkgchk -L \
			CSWxz \
			CSWwget \
			CSWcurl \
			CSWgit \
			CSWgit_doc \
			CSWgit_completion \
			CSWgit_emacs \
			CSWgit_gui \
			CSWgit_subtree \
			CSWgmake \
			CSWcmake \
			CSWlibicudata56 \
			CSWlibicui18n56 \
			CSWlibicuio56 \
			CSWlibicule56 \
			CSWlibiculx56 \
			CSWlibicutest56 \
			CSWlibicutu56 \
			CSWlibicuuc56 \
			CSWlibicu_dev \
			CSWlibssl1_0_0 \
			CSWlibssl3 \
			CSWlibssl_dev \
			CSWggettext \
			CSWggettextdoc \
			CSWggettexttrt \
			CSWggettext_data \
			CSWggettext_dev \
			CSWlibgettextlib0_18_1 \
			CSWlibgettextsrc0_18_1 \
			CSWswig \
			CSWpython\
			CSWgcc4core \
			CSWgcc4g++ \
			CSWgcc5core \
			CSWgcc5g++ \
			CSWtree \
		

	#wget -o \
	#	http://download.savannah.gnu.org/releases/libunwind/libunwind-1.2-rc1.tar.gz		
	#	https://sourceforge.net/projects/swig/files/swig/swig-3.0.8/swig-3.0.8.tar.gz/download
		
	git config --global user.name  \
		"moljac"
	git config --global user.email \
		"mcvjetko@holisicware.net"

	git clone --recursive https://github.com/moljac/bat.git

}

function llvm_compile()
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


	# Now we start the actual configuration and compilation of LLVM 
	# inside the 'build' folder outside of the main source directory 
	# so as to keep the main source tree clean
	../llvm-3.8.0/configure --enable-shared

	time make -j 3
}
