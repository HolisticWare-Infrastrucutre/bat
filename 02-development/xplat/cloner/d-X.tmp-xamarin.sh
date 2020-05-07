#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/X.tmp"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export URL=""
export BRANCH="master"
export DIR=""


export URL="https://github.com/xamarin/xamarin-android.git"
export BRANCH="master"
export DIR="xamarin-android-m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

cd $DIR_ROOT