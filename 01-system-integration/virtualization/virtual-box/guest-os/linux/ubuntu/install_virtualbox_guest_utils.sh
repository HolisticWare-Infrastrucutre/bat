#!/bin/bash

function install_virtualbox_guest_utils_ubuntu()
{
    sudo apt-get install -y \
        virtualbox-guest-dkms \
        virtualbox-guest-utils \
        virtualbox-guest-x11 \

 }
 
 install_virtualbox_guest_utils_ubuntu
 