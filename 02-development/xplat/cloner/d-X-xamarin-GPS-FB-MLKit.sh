#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/X/GPS-FB-MLKit"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export URL=""
export BRANCH="master"
export DIR=""

export URL="https://github.com/xamarin/GooglePlayServicesComponents.git"
export BRANCH="master"
export DIR="GPS-FB-m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/xamarin/GooglePlayServicesComponents.git"
export BRANCH="master_based_androidx"
export DIR="GPS-FB-ax"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR
    

cd $DIR_ROOT