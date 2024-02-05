#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
#
# https://www.warp.dev/
brew $ACTION_VERB --cask \
    warp \
    iterm2 \

#----------------------------------------------------------------------------------------------
# tools

# tools - brew completion
brew $ACTION_VERB \
    curl \
    wget \
    bash-completion \
    openssl \
    tmux \
    watchman \
    ffmpeg \
    exiftool \

brew $ACTION_VERB --cask \
    the-unarchiver \

brew $ACTION_VERB \
    zip \
    unzip \
    fuse-zip \
    p7zip \
    rar \
    archiver \
    snzip \
    lrzip \
    archiver \
    sevenzip \



brew $ACTION_VERB --cask \
    the-unarchiver \
    winzip \
    betterzip \


# tools for development
brew $ACTION_VERB \
    tree        \
    automake    \
    autoconf    \
    dos2unix    \
    gettext	    \
    libevent    \
    libtool     \
    gradle      \
    node        \
    openssl     \
    pkg-config  \
    watchman    \
    gettext     \
    pcre        \
    swig        \
