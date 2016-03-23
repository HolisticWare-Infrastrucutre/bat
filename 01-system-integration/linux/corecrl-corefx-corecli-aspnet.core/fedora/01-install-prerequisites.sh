#/bin/bash

user_add_to_sufoers
install_parallels_tools
install_prerequisites

function install_prerequisites()
{
	sudo yum install -y \
		git

	git config --global user.name  \
		"moljac"
	git config --global user.email \
		"mcvjetko@holisicware.net"

	git clone --recursive https://github.com/moljac/bat.git

}

function user_add_to_sufoers()
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






