#!/bin/bash

function install_tools()
{
    # installing common dependencies
    ../install-tools.sh 
    install_tools

    # Ubuntu 15.04/Debian 8 or later, you also need to install the libtool-bin package. 
    # Without it, following error will occur: 
    #       **Error**: You must have 'libtool' installed to compile Mono.
    sudo apt-get install -y \
        libtool-bin \

}

install_tools
