#!/bin/bash

function mono_build()
{
    PREFIX=$@
    if [ -z $PREFIX ]; then
    PREFIX="/usr/local"
    fi

    # Ensure you have write permissions to PREFIX
    sudo mkdir $PREFIX
    sudo chown -R `whoami` $PREFIX
    PATH=$PREFIX/bin:$PATH
    ./autogen.sh --prefix=$PREFIX
    make
}

mono_build

function mono_install()
{
    make_build
    make install
}
