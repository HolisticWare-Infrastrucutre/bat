sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo \
    "deb http://download.mono-project.com/repo/debian wheezy main" \
    | \
    sudo tee /etc/apt/sources.list.d/mono-xamarin.list
echo \
    "deb http://download.mono-project.com/repo/debian alpha main" \
    | \
    sudo tee /etc/apt/sources.list.d/mono-xamarin-alpha.list
sudo apt-get update -y

sudo apt install -y \
    curl \
    openjdk-8-jdk \
    git \
    make \
    automake \
    autoconf \
    libtool \
    unzip \
    vim-common \
    clang \
    nuget \
    mono-xbuild \
    referenceassemblies-pcl \
    lib32stdc++6 \
    lib32z1 \
    libzip4

mkdir /sources
cd /sources && git clone https://github.com/xamarin/xamarin-android.git
cd /sources/xamarin-android && git submodule init
cd /sources/xamarin-android && git submodule update external/mono
cd /sources/xamarin-android/external/mono && git submodule init
cd /sources/xamarin-android/external/mono && git submodule update external/referencesource
cd /sources/xamarin-android/external/mono && git submodule update --init --recursive
cd /sources/xamarin-android && make prepare
cd /sources/xamarin-android && make
