#!/bin/bash

# https://thrift.apache.org/docs/install/os_x
# https://thrift.apache.org/download
# https://thrift.apache.org/docs/install/

# https://www.boost.org/users/history/version_1_68_0.html
export URL=https://dl.bintray.com/boostorg/release/1.68.0/source/boost_1_68_0.tar.bz2
curl -v -L -C - -O $URL

tar xvjf boost_1_68_0.tar.bz2

# http://libevent.org/
export URL=https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
curl -v -L -C - -O $URL

tar xvzf libevent-2.1.8-stable.tar.gz

cd boost_1_68_0/

./bootstrap.sh

sudo ./b2 threading=multi address-model=64 variant=release stage install

cd ..

libevent-2.1.8-stable/
./configure --prefix=/usr/local 
make
sudo make install

http://www.apache.org/dyn/closer.cgi?path=/thrift/0.11.0/thrift-0.11.0.tar.gz