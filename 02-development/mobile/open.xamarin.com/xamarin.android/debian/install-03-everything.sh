#/bin/bash


function install_tools_core()
{
    # git to clone my scripts
    # aptitude for easier package dependency management during install
    # sudo is not installed by default on Debian

    sudo apt-get install -y \
            sudo \
            git \
            curl \
            wget \
            aptitude

    # edit /etc/sudoers        
    su
    nano /etc/sudoers

    git config --global user.name "Miljenko Cvjeko moljac mel"
    git config --global user.email mcvjetko@holisticware.net

}

function install_tools_productivity()
{
    # gcc and make to compile VirtualBox guest additions

    sudo apt-get install -y \
            gcc \
            make \

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

function install_clang()
{
    echo \
        "
        deb http://apt.llvm.org/jessie/ llvm-toolchain-jessie main 
        deb-src http://apt.llvm.org/jessie/ llvm-toolchain-jessie main 
        deb http://apt.llvm.org/jessie/ llvm-toolchain-jessie-3.8 main 
        deb-src http://apt.llvm.org/jessie/ llvm-toolchain-jessie-3.8 main 
        " \
    | \
    sudo tee /etc/apt/sources.list.d/xamarin-android-llvm.list
    cat /etc/apt/sources.list.d/xamarin-android-llvm.list
    sudo aptitude update

    wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

    sudo apt-add-repository "deb http://llvm.org/apt/trusty/ llvm-toolchain-jessie main"
    sudo apt-get update
    sudo apt-get install -y \
            clang-3.8 \
            lldb-3.8

    clang-3.8 -v
}

function install_java()
{
    echo \
        "
        deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
        deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
        " \
    | \
    sudo tee /etc/apt/sources.list.d/xamarin-android-java-8-debian.list

    sudo apt-key adv \
        --keyserver keyserver.ubuntu.com \
        --recv-keys EEA14886    

    sudo apt-get update -y
    sudo apt-get install -y \
        oracle-java8-installer
    java -version

    sudo update-alternatives --config java
    sudo update-alternatives --config javac

    java -version

}


function install_mono_from_packages()
{
    sudo apt-key adv \
        --keyserver hkp://keyserver.ubuntu.com:80 \
        --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
    echo "deb http://download.mono-project.com/repo/debian wheezy main" \
    | \
    sudo tee /etc/apt/sources.list.d/mono-xamarin.list
    
    sudo apt-get update

    # Common CA certificates are needed for ASF to work
    sudo apt-get install -y \
        ca-certificates 
    sudo apt-get install -y \
        mono-complete \
        referenceassemblies-pcl \


    mono -V
}


function install_tools_xamarin_android()
{
    sudo aptitude install -y \
        libgdiplus \
        nuget

    sudo aptitude install -y \
        automake autoconf \
        libtool \
        unzip \
        vim-common \
        clang \
        nuget \
        mono-xbuild \
        referenceassemblies-pcl \


    sudo aptitude install -y \
        lib32stdc++6 \
        lib32z1 \
        libzip4 \


    sudo aptitude install -y libzip4 

}


function compile_xamarin_android()
{
    git clone https://github.com/xamarin/xamarin-android.git
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



    error: RPC failed; result=56, HTTP code
    fatal: The remote end hung up unexpectedly
    fatal: early EOF
    fatal: index-pack failed

    git config --global http.postBuffer 524288000

