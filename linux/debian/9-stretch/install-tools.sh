#!/bin/bash

function install_tools()
{
    echo "deb http://download.mono-project.com/repo/debian wheezy main" | \
    sudo tee /etc/apt/sources.list.d/mono-official-debian.list
    
    echo "deb http://download.mono-project.com/repo/ubuntu xenial main" | \
    sudo tee /etc/apt/sources.list.d/mono-official-ubuntu.list

    sudo apt-key adv \
        --keyserver hkp://keyserver.ubuntu.com:80 \
        --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

    sudo apt-get -y update
    sudo apt-get -y upgrade

    sudo apt install -y \
        git \
        autotools-dev \
        automake \
        cmake \
        build-essential \
        libssh2-1-dev \
        zlib1g-dev \
        cli-common \
        libgtk2.0-cil-dev \
        libglade2.0-cil-dev \
        libgnome2.0-cil-dev \
        libgconf2.0-cil-dev \
        gtk-sharp2 \
        gnome-sharp2 \
        referenceassemblies-pcl \
        ca-certificates-mono \
        fsharp \


    sudo apt install -y \
        libmono-2.0.1 \
        mono-devel \
        mono-complete \
        mono-4.0-service \
        monodoc-manual \
        libmono-cil-dev \
        msbuild \
        mono-complete \

        # mono-devel
}

function uninstall_mono()
{
    sudo apt-get remove mono-*
    sudo apt-get autoremove    
}

install_tools
