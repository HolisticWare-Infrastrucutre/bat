#/bin/bash

export PACKAGE_MANAGER=apt-get

function install_prerequisites()
{
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
		swig \
		python \
		libedit \

	# lldb
	sudo $PACKAGE_MANAGER install -y \
		build-essential \
		subversion \
		libncurses5-dev
		swig \
		python2.7-dev \
		libedit-dev \
		doxygen \
		graphviz \


	sudo pip install epydoc # or install package python-epydoc

	git config --global user.name  \
		"moljac"
	git config --global user.email \
		"mcvjetko@holisicware.net"

	git clone --recursive https://github.com/moljac/bat.git

}

install_prerequisites


