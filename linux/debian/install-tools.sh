#!/bin/bash

function install_tools()
{
    sudo apt-get install -y \
        git \
        autoconf \
        libtool \
        automake \
        build-essential \
        mono-devel \
        gettext \
        cmake \
        python
        
}

install_tools
