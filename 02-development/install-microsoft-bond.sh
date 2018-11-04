#!/bin/bash

# install-microsoft-bond.sh

#Ubuntu 14.04:
sudo apt-get -y install \
            clang \
            cmake \
            zlib1g-dev \
            ghc \
            cabal-install \
            libboost-dev \
            libboost-thread-dev

cabal update
cabal install cabal-install

git clone --recursive https://github.com/Microsoft/bond.git
cd bond

mkdir build
cd build
cmake ..
make
sudo make install

# c++ python

sudo apt-get install \
            python2.7-dev \
            libboost-date-time-dev \
            libboost-test-dev \
            libboost-python-dev

cabal install happy