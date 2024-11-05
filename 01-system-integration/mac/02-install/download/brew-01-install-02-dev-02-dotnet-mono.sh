#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew \
    info \
        nuget

brew \
    list \
        nuget

brew \
    info \
        mono

brew \
    list \
        mono



brew uninstall --cask \
    mono-mdk

brew \
    $ACTION_VERB \
        mono


# https://www.mono-project.com/download/stable/#download-mac

brew \
    $ACTION_VERB \
        mono \
        msbuild \
        nuget \


# old
# brew install mono-mdk
# brew install visual-studio



# MSBuild auto-detection: using msbuild version '15.0' from 
#   '/Library/Frameworks/Mono.framework/Versions/6.12.0/lib/mono/msbuild/15.0/bin'.

# >>>> xbuild tool is deprecated and will be removed in future updates, use msbuild instead <<<<

# MSBUILD: error MSBUILD0004: Too many project files specified
