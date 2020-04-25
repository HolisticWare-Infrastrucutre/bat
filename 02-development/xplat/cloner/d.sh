#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/"
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
        --branch master \
        --recursive \
        $URL \
        $DIR






cd $DIR_ROOT