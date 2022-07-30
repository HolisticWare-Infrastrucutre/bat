#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/X/AX"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export URL=""
export BRANCH="master"
export DIR=""


export URL="https://github.com/xamarin/AndroidX.git"
export BRANCH="master"
export DIR="AX-m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/xamarin/AndroidX.git"
export BRANCH="master_based_20200328_media2_player_exoplayer_camera2"
export DIR="AX-media2_ExoPlayer"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR


cd $DIR_ROOT