#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/hw-edu"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

mkdir gh
mkdir gl

export BRANCH="master"
export URL=""
export DIR=""


export BRANCH="master"
export URL="https://gitlab.com/holisticware-education/tvz-cpp.git"
export DIR="./gl/tvz-cpp/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR






cd $DIR_ROOT