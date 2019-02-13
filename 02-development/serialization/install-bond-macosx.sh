#!/bin/bash

# https://www.diycode.cc/projects/Microsoft/bond
# https://github.com/Microsoft/bond

# add this to .bash_profile 
#   NOTE - remove `\` chars
echo "
# Go development - needed for Serialization Microsoft Bond
export GOPATH=\"${HOME}/.go\"
export GOROOT=\"$(brew --prefix golang)/libexec\"
export PATH=\"$PATH:${GOPATH}/bin:${GOROOT}/bin\"
test -d \"${GOPATH}" || mkdir "${GOPATH}\"
"

brew update

brew install \
    cmake \
    ghc \
    cabal-install \


brew install \
    boost \

#    boost-python \
brew install \
    --build-from-source \
    boost-python

brew install go

# Also a bunch of dev tools!

go get golang.org/x/tools/cmd/godoc

go get github.com/golang/lint/golint

code --install-extension ms-vscode.Go


sudo xcode-select --reset
xcode-select --install
sudo xcode-select --switch /Applications/Xcode.app
sudo xcode-select --switch /Library/Developer/CommandLineTools
sudo softwareupdate -ia --verbose
sudo xcodebuild -license

cabal update
cabal install happy

rm -fr bond/
git clone --recursive https://github.com/Microsoft/bond.git
cd bond

mkdir build
cd build
export PYTHON_LIBRARY=/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7.dylib \
#cmake ..
cmake .. \
    -DPYTHON_LIBRARY=/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7.dylib 
make
make --jobs 8 check

cd ..
mkdir build-xcode
cd build-xcode
cmake .. \
    -G Xcode .. \
    -DPYTHON_LIBRARY=/usr/local/Cellar/python/3.7.0/Frameworks/Python.framework/Versions/3.7/lib/libpython3.7.dylib 

make
make --jobs 8 check

sudo make install
