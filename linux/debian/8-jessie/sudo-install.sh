#!/bin/bash

function install_sudo()
{
    su -
    sudo apt install -y \
        sudo
    echo "parallels	ALL=(ALL:ALL) ALL" >> /etc/sudoers
}

install_sudo

