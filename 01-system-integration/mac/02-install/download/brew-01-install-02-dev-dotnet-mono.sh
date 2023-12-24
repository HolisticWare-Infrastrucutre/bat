#!/bin/bash

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

brew \
    install \
        mono \
        msbuild \
        nuget \





# MSBuild auto-detection: using msbuild version '15.0' from 
#   '/Library/Frameworks/Mono.framework/Versions/6.12.0/lib/mono/msbuild/15.0/bin'.

# >>>> xbuild tool is deprecated and will be removed in future updates, use msbuild instead <<<<

# MSBUILD: error MSBUILD0004: Too many project files specified
