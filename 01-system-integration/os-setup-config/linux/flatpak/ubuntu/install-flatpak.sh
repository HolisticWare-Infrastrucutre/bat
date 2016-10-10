#!/bin/bash

function install_flatpak_ubuntu()
{
    sudo add-apt-repository ppa:alexlarsson/flatpak
    sudo apt update
    sudo apt install flatpak
}

install_flatpak_ubuntu
