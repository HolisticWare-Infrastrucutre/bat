#!/bin/bash


alias files_show='\
defaults write com.apple.finder AppleShowAllFiles YES; \
killall Finder \
/System/Library/CoreServices/Finder.app\
'

defaults write com.apple.finder AppleShowAllFiles YES; \
killall Finder \
/System/Library/CoreServices/Finder.app\


alias files_hide='\
defaults write com.apple.finder AppleShowAllFiles NO; \
killall Finder \
/System/Library/CoreServices/Finder.app\
'

defaults write com.apple.finder AppleShowAllFiles NO; \
killall Finder \
/System/Library/CoreServices/Finder.app\

defaults write com.apple.finder AppleShowAllFiles YES

killall Finder
/System/Library/CoreServices/Finder.app


sudo gem install activesupport -v 4.2.6
sudo gem install cocoapods
pod

/usr/bin/ruby -e \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    
brew install \
    autoconf    \
    dos2unix    \
    gradle      \
    node        \
    openssl     \
    pkg-config  \
    watchman    \
    automake    \
    gettext     \
    libtool     \
    ntfs-3g     \
    pcre        \
    swig        \
    vlc         \

