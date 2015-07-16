#!/bin/bash

PREFIX=/usr/local/
PATH=$PREFIX/bin:$PATH

git clone https://github.com/mono/mono.git
cd mono
CC='cc -m32' ./autogen.sh --prefix=$PREFIX --disable-nls --build=i386-apple-darwin11.2.0
make

make install



make -f makefile.gnu



$PREFIX=/usr/local
git clone https://github.com/mono/mono.git
cd mono
./autogen.sh --prefix=$PREFIX --disable-nls

make get-monolite-latest
make

make \
	EXTERNAL_MCS=/Library/Frameworks/Mono.framework/Versions/Current/bin/mcs \
	EXTERNAL_RUNTIME=/Library/Frameworks/Mono.framework/Versions/Current/bin/mono

#-----------------------------------------------------------------------------------
The assembly mscorlib.dll was not found or could not be loaded.
It should have been installed in the `/usr/local/lib/mono/4.5/mscorlib.dll' 
directory.	
# http://stackoverflow.com/questions/23745781/mono-64-bit-on-mac-missing-4-5	
cd ./mcs/
make PROFILE=net_4_5 install	
make PROFILE=net_4_0 install	
make PROFILE=net_3_5 install	



# Mono references several external git submodules, for example a fork of 
# Microsoft's reference source code that has been altered to be suitable 
# for use with the Mono runtime.

# This section describes how to use it.

# An initial clone should be done recursively so all submodules will also 
# be cloned in a single pass:

$PREFIX=/usr/local
git clone https://github.com/mono/mono.git
#git clone --recursive git@github.com:mono/mono
cd mono

# Once cloned, submodules can be updated to pull down the latest changes. 
# This can also be done after an initial non-recursive clone:

git submodule update --init --recursive


./autogen.sh --prefix=$PREFIX --disable-nls




   80  mono uninstall
   81  make uninstall
   82  ls /usr/local/bin/
   83  rm  /usr/local/bin/mono*
   84  rm  /usr/local/bin/gmcs 
   85  ls /usr/local/bin/
   86  ls /usr/local/Library/
   87  rm /usr/local/lib/libmono*
   88  ls /usr/local/Library/
   89  ls /usr/local/lib/libMono*
   90  rm  /usr/local/lib/libMono*
   91  ls  /usr/local/include/mono-2.0
   92  rm  /usr/local/include/mono-2.0/
   93* rm -fr /usr/local
   94  ls  /usr/local/
   95  rm -fr  /usr/local/etc/mono
   96  ls -al /usr/local/doc/
   97  rm -fr /usr/local/opt/mono/
   98  mono
   99  mono -V
  100  which mono
  101  ls -al /usr/local/share/
  102  ls -al /usr/local/share/mono-2.0 
  103  rm -fr /usr/local/share/mono-2.0 

  
  
brew uninstall kmono
brew uninstall mono
brew link --overwrite mono
brew update
brew install mono


brew update 
brew unlink mono 
brew install mono