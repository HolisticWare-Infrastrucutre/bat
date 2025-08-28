#!/bin/bash



sudo apt-get update
sudo apt-get install -y \
    aptitude
sudo aptitude update 

# sudo aptitude full-upgrade
# sudo apt-get upgrade
# sudo apt-get dist-upgrade
    
sudo apt-get install -y \
        --fix-missing \
        git \
        wget \
        curl \
	    bzip2 \
        unzip \

sudo apt-get install -y \
        --fix-missing \
        make \
        automake \
        autoconf \
        autogen \
        libtool \
        gcc \
        g++ \
	    bison \
        gettext \

git clone --recursive \
    https://github.com/mono/mono.git


cd mono/
./autogen.sh
make get-monolite-latest
make

./runtime/_tmpinst/bin/mono --version
ls -al ./runtime/_tmpinst/bin/

make check

mono --version

sudo make install

mono --version

function install_prerequisites_dotnetcore()
{
    sudo apt-get install -y \
        cmake \
        llvm \
        clang \
        libunwind8 \
        libunwind8-dev \
        lldb \
        gettext \
        libicu-dev \
        liblttng-ust-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        uuid-dev \


    # Both the clang-3.6 and libicu-dev packages need to be installed. 
    # In addition, user should use update-alternatives to provide 
    # /usr/bin links for clang and clang++. 
    # To get clang-3.6 on a Raspberry Pi 2 user can use repositories 
    # provided by Robert C. Nelson.

    # Run the following commands to add the rcn-ee repository:

    wget http://repos.rcn-ee.com/debian/pool/main/r/rcn-ee-archive-keyring/rcn-ee-archive-keyring_2015.10.22~bpo90+20151022+1_all.deb
    sudo dpkg -i rcn-ee-archive-keyring_2015.10.22~bpo90+20151022+1_all.deb
    echo "deb [arch=armhf] http://repos.rcn-ee.com/debian/ jessie main" \
        | \
        sudo tee --append /etc/apt/sources.list
    sudo apt-get update

    sudo apt-get install -y \
        libicu-dev \
        clang-3.6 \

    sudo update-alternatives --install \
        /usr/bin/clang clang /usr/bin/clang-3.6 100
    sudo update-alternatives --install \
        /usr/bin/clang++ clang++ /usr/bin/clang++-3.6 100


    mkdir packages    
    cd packages/
    curl -L -O -C - http://mirrordirector.raspbian.org/raspbian/pool/main/l/llvm-toolchain-3.6/clang-3.6_3.6.2-3_armhf.deb
    sudo dpkg -i clang-3.6_3.6.2-3_armhf.deb

    ls -al /usr/bin/clang
    ls -al /usr/lib/llvm*
}

# http://mirrordirector.raspbian.org/raspbian/pool/main/l/llvm-toolchain-3.6/


# lrwxrwxrwx  1 root root         23 Nov 14  2014 llc -> ../lib/llvm-3.5/bin/llc
# lrwxrwxrwx  1 root root         23 Mar 10  2015 llc-3.5 -> ../lib/llvm-3.5/bin/llc
# lrwxrwxrwx  1 root root          8 Nov 14  2014 lldb -> lldb-3.5
# lrwxrwxrwx  1 root root         24 Mar 10  2015 lldb-3.5 -> ../lib/llvm-3.5/bin/lldb
# lrwxrwxrwx  1 root root         34 Mar 10  2015 lldb-gdbserver-3.5 -> ../lib/llvm-3.5/bin/lldb-gdbserver
# lrwxrwxrwx  1 root root         27 Mar 10  2015 lldb-mi-3.5 -> ../lib/llvm-3.5/bin/lldb-mi
# lrwxrwxrwx  1 root root         33 Mar 10  2015 lldb-platform-3.5 -> ../lib/llvm-3.5/bin/lldb-platform
# lrwxrwxrwx  1 root root         23 Nov 14  2014 lli -> ../lib/llvm-3.5/bin/lli
# lrwxrwxrwx  1 root root         23 Mar 10  2015 lli-3.5 -> ../lib/llvm-3.5/bin/lli
# lrwxrwxrwx  1 root root         36 Mar 10  2015 lli-child-target-3.5 -> ../lib/llvm-3.5/bin/lli-child-target
# lrwxrwxrwx  1 root root         27 Nov 14  2014 llvm-ar -> ../lib/llvm-3.5/bin/llvm-ar
# lrwxrwxrwx  1 root root         27 Mar 10  2015 llvm-ar-3.5 -> ../lib/llvm-3.5/bin/llvm-ar
# lrwxrwxrwx  1 root root         27 Nov 14  2014 llvm-as -> ../lib/llvm-3.5/bin/llvm-as
# lrwxrwxrwx  1 root root         27 Mar 10  2015 llvm-as-3.5 -> ../lib/llvm-3.5/bin/llvm-as
# lrwxrwxrwx  1 root root         35 Nov 14  2014 llvm-bcanalyzer -> ../lib/llvm-3.5/bin/llvm-bcanalyzer
# lrwxrwxrwx  1 root root         35 Mar 10  2015 llvm-bcanalyzer-3.5 -> ../lib/llvm-3.5/bin/llvm-bcanalyzer
# lrwxrwxrwx  1 root root         31 Nov 14  2014 llvm-config -> ../lib/llvm-3.5/bin/llvm-config
# lrwxrwxrwx  1 root root         31 Mar 10  2015 llvm-config-3.5 -> ../lib/llvm-3.5/bin/llvm-config
# lrwxrwxrwx  1 root root         28 Nov 14  2014 llvm-cov -> ../lib/llvm-3.5/bin/llvm-cov
# lrwxrwxrwx  1 root root         28 Mar 10  2015 llvm-cov-3.5 -> ../lib/llvm-3.5/bin/llvm-cov
# lrwxrwxrwx  1 root root         29 Nov 14  2014 llvm-diff -> ../lib/llvm-3.5/bin/llvm-diff
# lrwxrwxrwx  1 root root         29 Mar 10  2015 llvm-diff-3.5 -> ../lib/llvm-3.5/bin/llvm-diff
# lrwxrwxrwx  1 root root         28 Nov 14  2014 llvm-dis -> ../lib/llvm-3.5/bin/llvm-dis
# lrwxrwxrwx  1 root root         28 Mar 10  2015 llvm-dis-3.5 -> ../lib/llvm-3.5/bin/llvm-dis
# lrwxrwxrwx  1 root root         34 Nov 14  2014 llvm-dwarfdump -> ../lib/llvm-3.5/bin/llvm-dwarfdump
# lrwxrwxrwx  1 root root         34 Mar 10  2015 llvm-dwarfdump-3.5 -> ../lib/llvm-3.5/bin/llvm-dwarfdump
# lrwxrwxrwx  1 root root         32 Nov 14  2014 llvm-extract -> ../lib/llvm-3.5/bin/llvm-extract
# lrwxrwxrwx  1 root root         32 Mar 10  2015 llvm-extract-3.5 -> ../lib/llvm-3.5/bin/llvm-extract
# lrwxrwxrwx  1 root root         27 Nov 14  2014 llvm-ld -> ../lib/llvm-3.5/bin/llvm-ld
# lrwxrwxrwx  1 root root         29 Nov 14  2014 llvm-link -> ../lib/llvm-3.5/bin/llvm-link
# lrwxrwxrwx  1 root root         29 Mar 10  2015 llvm-link-3.5 -> ../lib/llvm-3.5/bin/llvm-link
# lrwxrwxrwx  1 root root         27 Nov 14  2014 llvm-mc -> ../lib/llvm-3.5/bin/llvm-mc
# lrwxrwxrwx  1 root root         27 Mar 10  2015 llvm-mc-3.5 -> ../lib/llvm-3.5/bin/llvm-mc
# lrwxrwxrwx  1 root root         33 Mar 10  2015 llvm-mcmarkup-3.5 -> ../lib/llvm-3.5/bin/llvm-mcmarkup
# lrwxrwxrwx  1 root root         27 Nov 14  2014 llvm-nm -> ../lib/llvm-3.5/bin/llvm-nm
# lrwxrwxrwx  1 root root         27 Mar 10  2015 llvm-nm-3.5 -> ../lib/llvm-3.5/bin/llvm-nm
# lrwxrwxrwx  1 root root         32 Nov 14  2014 llvm-objdump -> ../lib/llvm-3.5/bin/llvm-objdump
# lrwxrwxrwx  1 root root         32 Mar 10  2015 llvm-objdump-3.5 -> ../lib/llvm-3.5/bin/llvm-objdump
# lrwxrwxrwx  1 root root         29 Nov 14  2014 llvm-prof -> ../lib/llvm-3.5/bin/llvm-prof
# lrwxrwxrwx  1 root root         33 Mar 10  2015 llvm-profdata-3.5 -> ../lib/llvm-3.5/bin/llvm-profdata
# lrwxrwxrwx  1 root root         31 Nov 14  2014 llvm-ranlib -> ../lib/llvm-3.5/bin/llvm-ranlib
# lrwxrwxrwx  1 root root         31 Mar 10  2015 llvm-ranlib-3.5 -> ../lib/llvm-3.5/bin/llvm-ranlib
# lrwxrwxrwx  1 root root         32 Mar 10  2015 llvm-readobj-3.5 -> ../lib/llvm-3.5/bin/llvm-readobj
# lrwxrwxrwx  1 root root         31 Nov 14  2014 llvm-rtdyld -> ../lib/llvm-3.5/bin/llvm-rtdyld
# lrwxrwxrwx  1 root root         31 Mar 10  2015 llvm-rtdyld-3.5 -> ../lib/llvm-3.5/bin/llvm-rtdyld
# lrwxrwxrwx  1 root root         29 Nov 14  2014 llvm-size -> ../lib/llvm-3.5/bin/llvm-size
# lrwxrwxrwx  1 root root         29 Mar 10  2015 llvm-size-3.5 -> ../lib/llvm-3.5/bin/llvm-size
# lrwxrwxrwx  1 root root         31 Mar 10  2015 llvm-stress-3.5 -> ../lib/llvm-3.5/bin/llvm-stress
# lrwxrwxrwx  1 root root         35 Mar 10  2015 llvm-symbolizer-3.5 -> ../lib/llvm-3.5/bin/llvm-symbolizer
# lrwxrwxrwx  1 root root         31 Nov 14  2014 llvm-tblgen -> ../lib/llvm-3.5/bin/llvm-tblgen
# lrwxrwxrwx  1 root root         31 Mar 10  2015 llvm-tblgen-3.5 -> ../lib/llvm-3.5/bin/llvm-tblgen
# pp-trace -> ../lib/llvm-3.5/bin/pp-trace
# pp-trace-3.5 -> ../lib/llvm-3.5/bin/pp-trace
# pp-trace-3.6 -> ../lib/llvm-3.6/bin/pp-trace




    cd ../



function dotnetcore_git_clone()
{
    sysctl fs.file-max
    #nano /etc/sysctl.conf
    cat /etc/sysctl.conf
    echo "fs.file-max = 100000" >> /etc/sysctl.conf
    sudo sysctl -p

    md dotnet-core
    cd dotnet-core/

    git clone --recursive \
            https://github.com/dotnet/coreclr.git
    git clone --recursive \
            https://github.com/dotnet/cli.git            
    git clone --recursive \
            https://github.com/dotnet/corefx.git
    git clone --recursive \
            https://github.com/dotnet/core-setup.git    

    cd coreclr/

}       




# Select a certificate in the popup window
# 
# Choose one of the following
# 
#   
# PIN (recommended)
#   
# Physical smart card (Microsoft Intranet Level 2 User CA)
#   
# Physical smart card (Microsoft Intranet Level 2 User CA)
#   
# Virtual smart card (MSIT User CA)
#   
# Virtual smart card (MSIT User CA)
# 
# Do not choose this type of certificate
#   
# If you pick this type of certificate, you'll need to start over.
#   
# If you pick this type of certificate, you'll need to start over.
