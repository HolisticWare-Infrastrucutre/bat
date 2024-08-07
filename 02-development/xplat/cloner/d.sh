#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/X/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/X.tmp/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/HW/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/hw-core/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/hw-tools/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/hw-bindings/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/hw-edu/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/hw-talks/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/Samples/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/system-installed/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/tmp/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/Ph4ct3x/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/Ph4ct3x/gh/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/Ph4ct3x/gl/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/d/Ph4ct3x/bt/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export BRANCH="master"
export URL=""
export DIR=""


export BRANCH="master"
export URL="https://github.com/moljac/HolisticWare.WebSite.Notes.git"
export DIR="./HolisticWare.WebSite.Notes/"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/moljac/bin.macosx.git"
export DIR="./bin/"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR


export DIR="./bin//dotnet/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

# https://devblogs.microsoft.com/dotnet/announcing-the-net-core-uninstall-tool-1-0/
# https://github.com/dotnet/cli-lab/releases
# https://dev.to/marcusturewicz/remove-old-net-versions-with-the-new-uninstall-tool-1kmb

cd $DIR_ROOT