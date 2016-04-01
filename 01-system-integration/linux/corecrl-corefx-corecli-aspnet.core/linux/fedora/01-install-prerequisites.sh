#/bin/bash

PACKAGE_MANAGER=yum

function install_prerequisites()
{
	PACKAGE_MANAGER=yum

	sudo $PACKAGE_MANAGER install -y \
		git

	# Install required dependencies 
	sudo $PACKAGE_MANAGER install -y \
		tree \

	# build-essential equivalent
	sudo $PACKAGE_MANAGER install -y \
		dpkg-dev \
		gcc \
		gcc-c++ \
		make \
		cmake \
		ninja-build \
		glibc-devel \
		glibc-devel.i686 \
		swig \
		python \
		libedit \
		
	# fedora bug ninja is packaged and installed as	
	# /usr/bin/ninja-build
	sudo ln -s /usr/bin/ninja-build /usr/bin/ninja

	# lldb
	sudo $PACKAGE_MANAGER install -y \
		libedit-devel \
		libxml2-devel \
		ncurses-devel \
		python-devel \
		swig \
		

	# 2016-03-21 gcc-c++ installs 
	# 	5.3.1 which results in internal compiler error
	#	increase RAM (solved interal compiler error) on Parallels VM


	git config --global user.name  \
		"moljac"
	git config --global user.email \
		"mcvjetko@holisicware.net"

	git clone --recursive https://github.com/moljac/bat.git

}

function user_add_to_sudoers()
{
	su
	visudo
	# add
	# moljac    ALL=(ALL)      ALL
}

function install_parallels_tools()
{

	yum install -y \
		gcc \
		kernel-devel-$(uname -r) \
		kernel-headers-$(uname -r) \
		make \
		checkpolicy \
		selinux-policy-devel


	eject /dev/sr0 
	mkdir /media/cdrom/
	mount -o exec /dev/sr0 /media/cdrom
	cd /media/cdrom/
	./install
}


user_add_to_sufoers
install_parallels_tools
install_prerequisites





