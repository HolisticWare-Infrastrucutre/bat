#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/e/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/e/personal/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR



export BRANCH="master"
export URL=""
export DIR=""


export BRANCH="master"
export URL="https://gitlab.com/moljac-sport/judo.git"
export DIR="./judo/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://gitlab.com/moljac-microsoft/microsoft.git"
export DIR="./microsoft/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


cd $DIR_ROOT