#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
#
# https://iterm2.com/
brew \
    $ACTION_VERB \
        --cask \
            iterm2 \

# https://www.warp.dev/
# https://www.warp.dev/pricing
# AI Term/CLI/Coding-Assistant/Coding-Agent
# Free for individuals
brew \
    $ACTION_VERB \
        --cask \
            warp \


#----------------------------------------------------------------------------------------------
# tools

# tools - brew completion
brew \
    $ACTION_VERB \
        --formula \
            curl \
            wget \
            bash-completion \
            openssl \
            tmux \
            watchman \
            ffmpeg \
            exiftool \
            gnu-sed \

brew \
    $ACTION_VERB \
        --formula \
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
            brotli \
            bzip2 \
            bzip3 \
            gzip \
            laszip \
            lhasa \
            lizard \
            lzip \
            ncompress \
            rzip \
            snzip \    



# tools for development
brew \
    $ACTION_VERB \
        --formula \
            tree        \

brew \
    $ACTION_VERB \
        --formula \
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


brew \
    $ACTION_VERB \
        --cask \
            the-unarchiver \

#           winzip \
#           betterzip \
#           izip \
#           MacWinZipper \
#           MacZip \
#           MacZip4Win \
#           WinZip \
