

# https://github.com/mono/mono



PREFIX=/opt/local

# Ensure you have write permissions to $PREFIX
mkdir $PREFIX
sudo chown -R `whoami` $PREFIX




#===============================================================================
# if updates were recently most of XCode stuff might be meesed up
# install xcode commandline tools
# just accept dialog
xcode-select --install
#===============================================================================





# Downlaod and build dependencies
mkdir ~/Build
cd ~/Build
curl -O ftp://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz
curl -O ftp://ftp.gnu.org/gnu/automake/automake-1.14.tar.gz
curl -O ftp://ftp.gnu.org/gnu/libtool/libtool-2.4.2.tar.gz

for i in *.tar.gz; do tar xzvf $i; done
for i in */configure; do (cd `dirname $i`; ./configure --prefix=$PREFIX && make && make install); done


git clone git://github.com/mono/mono.git



PATH=$PREFIX/bin:$PATH

cd mono


#===============================================================================
#===============================================================================

# 32 bits
CC='cc -m32' ./autogen.sh --prefix=$PREFIX --disable-nls --build=i386-apple-darwin11.2.0

# 64 bits
./autogen.sh --prefix=$PREFIX --disable-nls


make

make check

make install



#===============================================================================
# did not help
#
# older versions of CMAKE can pick up frameworks from older versions of Mono,
# which are 32-bit only, and fail builds. I don't know from your build output
# what version of Homebrew you are running, but you may need to brew update,

# brew rm cmake && brew install cmake
#===============================================================================





sudo certmgr -ssl -m https://go.microsoft.com
sudo certmgr -ssl -m https://nugetgallery.blob.core.windows.net
sudo certmgr -ssl -m https://nuget.org


mozroots --import --sync

mono --version


# http://graemechristie.github.io/graemechristie/blog/2014/05/26/asp-dot-net-vnext-on-osx-and-linux/

# https://github.com/graemechristie/Home/tree/KvmShellImplementation#osxlinux

curl \
  https://raw.githubusercontent.com/graemechristie/Home/KvmShellImplementation/kvmsetup.sh \
  | \
  sh && source ~/.kre/kvm/kvm.sh && kvm upgrade
