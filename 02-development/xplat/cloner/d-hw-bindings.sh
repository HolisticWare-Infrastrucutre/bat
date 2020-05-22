#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/hw-bindings"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

mkdir gh
mkdir gl

export BRANCH="master"
export URL=""
export DIR=""


export BRANCH="master"
export URL="https://gitlab.com/holisticware-components/HolisticWare.Core.Ideas.git"
export DIR="./00-HWC.Ideas/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR







cd $DIR_ROOT