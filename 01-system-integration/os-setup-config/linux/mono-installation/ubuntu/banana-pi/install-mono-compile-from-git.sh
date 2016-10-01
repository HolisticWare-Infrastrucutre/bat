#!/bin/bash


apt-get update -y
apt-get install -y aptitude 
aptitude update -y

apt-get install -y \
    nano \
    openssh-server \


ps -e | grep ssh
/etc/init.d/ssh start

apt-get install -y \
    wget \
    curl \
    git \
    unzip \

apt-get install -y \
    make \
    automake \
    autoconf \
    gcc \
    g++ \
    libtool \
    gettext \
    gettext-devel \
    bison \
    intltool \
    libiconv \
    libtool \
    pkg-config \


git clone --recursive https://github.com/mono/mono.git
cd mono
./autogen.sh --disable-nls

# http://download.mono-project.com/monolite/
make get-monolite-latest
ls -al ./mono/mini/mono
./mono/mini/mono -V

make
ls -al ./runtime/_tmpinst/bin/mono
./runtime/_tmpinst/bin/mono -V

make check



sudo aptitude install -y \
        make \
        automake \
        autoconf \
        autogen \
        libtool \
        gcc \
        g++ \
	    bison \
        gettext \


