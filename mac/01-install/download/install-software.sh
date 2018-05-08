#!/bin/bash

# scriptcs
git clone https://github.com/scriptcs/scriptcs
cd scriptcs
git checkout dev
chmod +x build.sh
sudo ./build.sh.
cd ..

# https://wiki.octave.org/Octave_for_macOS
brew doctor
brew outdated

# brew update
# brew upgrade
# brew doctor

brew tap homebrew/core
brew tap homebrew/science
brew install \
            Caskroom/cask/xquartz \
            r

# brew install r           
#            homebrew/science/r \


brew install \
            octave \


brew install \
            python \
            python3 \

python --version
python3 --version
which pip
which pip3

# python packages: Scientific computing:
pip install numpy
pip install scipy
pip install sympy
python -c 'import numpy ; numpy.test();'
python -c 'import scipy ; scipy.test();'

# python packages: Data management:
pip install pandas


# python packages: plotting
pip install matplotlib
#brew install \
#    homebrew/python/matplotlib \
#    --with-cairo \
#    --with-tex

