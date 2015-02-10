#!/bin/bash

wget http://dist.libuv.org/dist/v1.0.0-rc2/libuv-v1.0.0-rc2.tar.gz
tar -xvf libuv-v1.0.0-rc2.tar.gz
cd libuv-v1.0.0-rc2/

#==============================================================
# build with autotools

#==============================================================

#==============================================================
# build with gyp
sudo apt-get install g++
mkdir -p build
git clone https://git.chromium.org/external/gyp.git build/gyp
#==============================================================

./gyp_uv.py -f make -Duv_library=shared_library
make -C out
ls -al out/Debug/lib.target/libuv.so
ls -al out/Debug/lib.target/

sudo cp out/Debug/lib.target/libuv.so /usr/lib/libuv.so.1.0.0-rc2
sudo ln -s libuv.so.1.0.0-rc2 /usr/lib/libuv.so.1

#==============================================================
# install
ls -al /usr/lib/libuv.so.1.0.0-rc2
ls -al /usr/lib/libuv.so.1
#==============================================================
