#!/bin/bash


sudo apt-get update
sudo apt-get install -y \
    aptitude
sudo aptitude update 

# sudo aptitude full-upgrade
# sudo apt-get upgrade
# sudo apt-get dist-upgrade
    
sudo apt-get install -y \
        --fix-missing \
        git \
        wget \
        curl \
	    bzip2 \
        unzip \

sudo apt-get install -y \
        --fix-missing \
        make \
        automake \
        autoconf \
        autogen \
        libtool \
        gcc \
        g++ \
	    bison \
        gettext \

git clone --recursive \
    https://github.com/mono/mono.git


cd mono/
./autogen.sh
make get-monolite-latest
make

./runtime/_tmpinst/bin/mono --version
ls -al ./runtime/_tmpinst/bin/

make check

mono --version

sudo make install

mono --version

