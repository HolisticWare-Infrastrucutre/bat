#!/bin/bash

function install_parallel_tools()
{
    sudo apt install -y \
        gcc \
        linux-headers-3.16.0.4-amd64 \
        make \
        dkms

    umount /media/cdrom
    mount -o exec /media/cdrom
    /media/cdrom/install 
}

install_parallel_tools

