#/bin/bash

# http://www.mono-project.com/docs/compiling-mono/mac/
# http://www.mono-project.com/docs/compiling-mono/linux/
# http://www.mono-project.com/docs/compiling-mono/parallel-mono-environments/

PREFIX=/usr/local/

git clone https://github.com/mono/mono.git
cd mono

# 64b support
#./autogen.sh --prefix=$PREFIX --disable-nls
./autogen.sh --prefix=$PREFIX

#==========================================================================	
#.......................................................
# build with donwloaded monolitefrom git
# ./autogen.sh must be run prior to this

# make get-monolite-latest
#.......................................................

#.......................................................
# build with mono installation specified:
#	compiler 	- mcs 
#	runtime 	- mono

make \
	EXTERNAL_MCS=/usr/bin/mcs \
	EXTERNAL_RUNTIME=/usr/bin/mono
#.......................................................

#.......................................................
# build with existing mono (automagically searched)
# make
#.......................................................
#==========================================================================	

# make install
