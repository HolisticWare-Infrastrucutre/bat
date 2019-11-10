#/bin/bash

function install_tools_core()
{
    # git to clone my scripts
    # aptitude for easier package dependency management during install
    # sudo is not installed by default on Debian

    sudo dnf install -y \
            sudo \
            git \
            curl \
            wget \


    # edit /etc/sudoers        
    su
    nano /etc/sudoers

    git config --global user.name "Miljenko Cvjeko moljac mel"
    git config --global user.email mcvjetko@holisticware.net
}

function install_tools_productivity()
{
    # gcc and make to compile VirtualBox guest additions

    sudo dnf install -y \
            kernel-devel \
            kernel-headers \
            gcc \
            make \
            perl \

    sudo sh /media/cdrom/autorun.sh

}

function configure_os_productivity()
{
    # show files on desktop
    gsettings set \
        org.gnome.desktop.background show-desktop-icons true

    # show shares on desktop
    gsettings set \
        org.gnome.nautilus.desktop volumes-visible true

    # restart nautilus
    nautilus -q
    nautilus

    gsettings set \
        org.gnome.settings-daemon.plugins.power sleep-display-ac 6000
    gsettings set \
        org.gnome.settings-daemon.plugins.power sleep-display-battery 6000
    gsettings set \
        org.gnome.desktop.session idle-delay 6000
    gsettings set \
        org.gnome.desktop.screensaver idle-activation-enabled 'true'
    gsettings set \
        org.gnome.desktop.screensaver lock-enabled 'true'
    gsettings set \
        org.gnome.desktop.screensaver lock-delay 9000
}

function install_tools_to_compile_xamarin_android_clang()
{
    # dnf group install "Development Tools" "C Development Tools and Libraries"
    sudo dnf install -y \
        kernel-devel \
        clang
}

function install_tools_to_compile_xamarin_android_java()
{   
    sudo dnf install -y \
        java-1.8.0-openjdk-devel.x86_64
    java -version

}


function install_compile_xamarin_android_mono_from_packages()
{
    sudo rpm \
        --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
    sudo dnf config-manager \
        --add-repo http://download.mono-project.com/repo/centos/
    sudo dnf install -y --best --allowerasing \
        nuget \
        ca-certificates \
        mono-devel \
        referenceassemblies-pcl \
        libgdiplus \
        mono-xbuild \

 #      mono-devel \
 

    sudo dnf update -y 

    mono -V
}


function install_tools_to_compile_xamarin_android_diverse()
{
    sudo dnf install -y \
        automake autoconf \
        libtool \
        unzip \
        vim-common \


    sudo dnf install -y \
        libstdc++6.i686\
        zlib.i686 \
        libzip4 \

}


function compile_xamarin_android()
{
    # error: RPC failed; result=56, HTTP code
    # fatal: The remote end hung up unexpectedly
    # fatal: early EOF
    # fatal: index-pack failed
    git config --global http.postBuffer 524288000

    git clone --recursive https://github.com/xamarin/xamarin-android.git
    cd xamarin-android/
    git submodule init
    git submodule update external/mono
    cd external/mono 
    git submodule init
    git submodule update external/referencesource
    git submodule update --init --recursive
    cd ../../
    make prepare
    make
}


install_tools_core
install_tools_productivity
configure_os_productivity

install_tools_to_compile_xamarin_android_clang
install_tools_to_compile_xamarin_android_java
install_tools_to_compile_xamarin_android_mono_from_packages
install_tools_to_compile_xamarin_android_diverse

compile_xamarin_android

