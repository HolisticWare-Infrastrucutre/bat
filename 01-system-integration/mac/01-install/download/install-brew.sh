#!/bin/bash

# https://github.com/Homebrew/homebrew-cask/blob/master/USAGE.md

brew list
brew outdated

brew update

# Download and update ALL software packages installed:

brew upgrade

# To see which files would be removed as no longer needed:

brew cleanup -n

# No response if there is nothing to clearn.

# To really remove all files no longer needed:

brew cleanup

#----------------------------------------------------------------------------------------------
# 
brew cask install osxfuse
brew install \
        ntfs-3g \


brew install \
        tree \
        openssl \
        tmux \
        watchman \
        ffmpeg \
        
        
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
brew cask install powershell

brew update
brew cask upgrade powershell
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
# 
brew install \
        tree \
        automake \
        autoconf \
        dos2unix \
        gettext	\
        libevent \
        libtool \
        pkg-config \
        pcre \
        swig \
        p7zip \
        
#----------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------
# 
brew install \
        adoptopenjdk \
        gradle \
        ant	\

#----------------------------------------------------------------------------------------------


#----------------------------------------------------------------------------------------------
# 
brew install \
        node		
#----------------------------------------------------------------------------------------------

brew cask install \
        visual-studio-code \
        android-studio \


#----------------------------------------------------------------------
# 
brew install \
        octave \
        R \
        
        
brew cask install \
        firefox \
        opera \
        microsoft-edge-beta \
        chromium \
        
#----------------------------------------------------------------------------------------------

# if you receive this Error: Cask 'dotnet-sdk' conflicts with 'dotnet'.
# then you have to uninstall dotnet first:
brew cask uninstall dotnet
brew cask install dotnet-sdk



# to remove all the packages installed but keep Homebrew around one 
# could also do something like:

# brew list -1 | xargs brew rm


#----------------------------------------------------------------------------------------------
# https://blog.shvetsov.com/2014/11/homebrew-cheat-sheet-and-workflow.html

brew cask install \
        db-browser-for-sqlite
#----------------------------------------------------------------------------------------------

#----------------------------------------------------------------------------------------------
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

  pip3 install --upgrade pip
  pip3 install jupyter
  
  pip2 install --upgrade pip
  pip2 install jupyter
#----------------------------------------------------------------------------------------------
