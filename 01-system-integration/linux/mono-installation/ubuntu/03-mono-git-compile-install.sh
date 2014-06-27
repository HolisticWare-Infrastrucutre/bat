#!/bin/bash

# -----------------------------------------------------------------------------------
# Ubuntu 
#		14.04 server
# -----------------------------------------------------------------------------------

sudo aptitude update && sudo aptitude full-upgrade

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade

sudo apt-get install -f \
	gcc g++ automake autoconf autogen libtool make \
	bison gettext \
	bzip2 wget curl unzip git 

	
cd /tmp
	
git clone git://github.com/mono/mono.git

cp -fr mono mono-git-cloned


cd mono
./autogen.sh --prefix=/usr/local
make get-monolite-latest

make EXTERNAL_MCS=${PWD}/mcs/class/lib/monolite/gmcs.exe

sudo make install	









