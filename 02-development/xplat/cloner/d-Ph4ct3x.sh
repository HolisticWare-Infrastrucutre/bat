#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/Ph4ct3x"
[ ! -d $DIR ] && echo "Folder $DIR does not exists. Exiting ..." && exit 
[ -d $DIR ] && cd $DIR

mkdir gh
mkdir gh/bt
mkdir gh/hrm
mkdir gl

export URL=""
export BRANCH="master"
export DIR=""

export BRANCH="master"
export URL="https://github.com/moljac/Ph4ct3x.git"
export DIR="./gh/Ph4ct3x/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/moljac/Ph4ct3x.Data.Public.git"
export DIR="./gh/Ph4ct3x.Data.Public/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR





export BRANCH="master"
export URL="https://gitlab.com/holisticware-applications/HolisticWare.Ph4ct3x.git"
export DIR="./gl/Ph4ct3x/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://gitlab.com/holisticware-applications/HolisticWare.Ph4ct3x.Docs.git"
export DIR="./gl/Ph4ct3x.Docs/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://gitlab.com/holisticware-applications/holisticware.ph4ct3x.data.private.git"
export DIR="./gl/Ph4ct3x.Data.Private/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR
