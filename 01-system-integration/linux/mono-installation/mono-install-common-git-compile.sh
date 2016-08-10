#!/bin/bash

#-----------------------------------------------------------------------------------
cd /tmp
rm -rf mono
rm -rf mono-git-cloned mono

git clone --recursive \
      git://github.com/mono/mono.git mono-git-cloned
rm -rf mono
cp -fr mono-git-cloned mono
cd mono

PREFIX_MONO=/usr/local
./autogen.sh --prefix=$PREFIX_MONO

# if there is working Mono installation, an obvious choice is to install 
# the latest released packages of 'mono' for distribution and running 
# 
# autogen.sh; make; make install 
#
# Slightly more risky approach: this may not work, so start from the 
# released tarball as detailed above.
#
# This works by first getting the latest version of the 'monolite' distribution, 
# which contains just enough to run the 'mcs' compiler
#
# This will download and automatically gunzip and untar the tarball, and place 
# the files appropriately so user can then just run: 

# mcs (gmcs) working cs compiler is needed for installation
# sudo for some distros that need elevated rights
#
sudo make get-monolite-latest

sudo make EXTERNAL_MCS=${PWD}/mcs/class/lib/monolite/gmcs.exe

PREFIX_MONO=/usr/local
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PREFIX_MONO/lib/


sudo echo "$PREFIX_MONO/lib" >> /etc/ld.so.conf.d/mono_lib.conf
cat /etc/ld.so.conf
cat /etc/ld.so.conf.d/mono_lib.conf



make check


# Using "make install" with a user without privileges should give errors.
#
# However, using "root" as the user to install is actually not the recommended 
# way to do things. The encouraged way is to configure and compile mono using 
# normal user, and then use "sudo" for the installation
sudo make install
mono -V
# -----------------------------------------------------------------------------------

 
 
 
