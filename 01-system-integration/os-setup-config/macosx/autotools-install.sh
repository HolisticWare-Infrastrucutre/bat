

# MacOS


#-------------------------------------------------------------
# XCode commandline tools ???
# /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/libtool

# mono
# /Library/Frameworks/Mono.framework/Versions/4.4.1/share/automake-1.13/am/libtool.am

# brew
# /usr/bin/libtool
#-------------------------------------------------------------

brew install automake
brew install libtool

curl -OL http://ftpmirror.gnu.org/autoconf/autoconf-2.69.tar.gz
tar -xzf autoconf-2.69.tar.gz 
cd autoconf-2.69
./configure && make && sudo make install
 
curl -OL http://ftpmirror.gnu.org/automake/automake-1.14.tar.gz
tar -xzf automake-1.14.tar.gz
cd automake-1.14
./configure && make && sudo make install
 
curl -OL http://ftpmirror.gnu.org/libtool/libtool-2.4.2.tar.gz
tar -xzf libtool-2.4.2.tar.gz
cd libtool-2.4.2
./configure && make && sudo make install
