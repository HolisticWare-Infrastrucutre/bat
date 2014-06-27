#!/bin/bash


# -----------------------------------------------------------------------------------
cd /tmp

git clone git://github.com/mono/mono.git mono-git-cloned
rm -rf mono
cp -fr mono-git-cloned mono
cd mono

# if you don't have a working Mono installation, an obvious choice is to install 
#the latest released packages of 'mono' for your distribution and running 
#autogen.sh; make; make install 

# You can also try a slightly more risky approach: this may not work, so start 
# from the released tarball as detailed above.

# This works by first getting the latest version of the 'monolite' distribution, 
# which contains just enough to run the 'mcs' compiler. You do this with:

# Run the following line after ./autogen.sh
make get-monolite-latest

# This will download and automatically gunzip and untar the tarball, and place 
# the files appropriately so that you can then just run: 



PREFIX=/usr/local
./autogen.sh --prefix=$PREFIX
make get-monolite-latest

make EXTERNAL_MCS=${PWD}/mcs/class/lib/monolite/gmcs.exe
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX/lib/
make check

sudo make install
mono -V
# -----------------------------------------------------------------------------------
	