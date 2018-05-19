#!/bin/bash

function install_git()
{
    sudo apt install -y \
        git

    git clone --recursive \
        https://github.com/moljac/bat.git \
        ~/bat
}

install_git

