#!/bin/bash

# https://www.diycode.cc/projects/Microsoft/bond

sudo apt-get install \
        clang \
        cmake \
        zlib1g-dev \
        ghc \
        cabal-install \
        libboost-dev \
        libboost-thread-dev
        python2.7-dev \
        libboost-date-time-dev \
        libboost-test-dev \
        libboost-python-dev \
        golang \


cabal install happy
cabal update
cabal install \
        cabal-install


git clone --recursive https://github.com/Microsoft/bond.git
cd bond
mkdir build
cd build
cmake ..
make

make --jobs 8 check
sudo make install
