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
	EXTERNAL_MCS=/foo/bar/mcs \
	EXTERNAL_RUNTIME=/somewhere/else/mono