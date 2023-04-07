#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/X/XA"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export URL=""
export BRANCH="master"
export DIR=""


export URL="https://github.com/xamarin/xamarin-android.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR


cd $DIR_ROOT