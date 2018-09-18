#!/bin/bash

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



#----------------------------------------------------------------------
# 
brew install \
        ntfs-3g \


brew install \
        tree \
        openssl \
        tmux \
        watchman \
        ffmpeg \

#----------------------------------------------------------------------
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
        

#----------------------------------------------------------------------
# 
brew install \
        gradle \
        ant	\



#----------------------------------------------------------------------
# 
brew install \
        node		


#----------------------------------------------------------------------
# 
brew install \
        octave \
        R \



# to remove all the packages installed but keep Homebrew around one 
# could also do something like:

# brew list -1 | xargs brew rm


# https://blog.shvetsov.com/2014/11/homebrew-cheat-sheet-and-workflow.html
