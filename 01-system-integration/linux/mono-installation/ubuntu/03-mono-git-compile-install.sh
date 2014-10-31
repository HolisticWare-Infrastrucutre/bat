#!/bin/bash

# -----------------------------------------------------------------------------------
# Ubuntu 
#		14.04 server
# -----------------------------------------------------------------------------------



	
cd /tmp
	
git clone git://github.com/mono/mono.git

cp -fr mono mono-git-cloned


cd mono
./autogen.sh --prefix=/usr/local
make get-monolite-latest

make EXTERNAL_MCS=${PWD}/mcs/class/lib/monolite/gmcs.exe

sudo make install	









