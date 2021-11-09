#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/e/"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export DIR="$DIR_ROOT/e/personal-private/"
[ ! -d $DIR ] && mkdir $DIR 

export DIR="$DIR_ROOT/e/edu/"
[ ! -d $DIR ] && mkdir $DIR 

export DIR="$DIR_ROOT/e/katodix/"
[ ! -d $DIR ] && mkdir $DIR 

export DIR="$DIR_ROOT/e/commercial/"
[ ! -d $DIR ] && mkdir $DIR 

export DIR="$DIR_ROOT/e/hw-talks/"
[ ! -d $DIR ] && mkdir $DIR 

export BRANCH="master"
export URL=""
export DIR=""


export BRANCH="master"
export URL="https://gitlab.com/moljac-private/notes.git"
export DIR="./personal-private/moljac/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://gitlab.com/moljac-private/deda.git"
export DIR="./personal-private/deda/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://gitlab.com/holisticware-private/notes.git"
export DIR="./personal-private/holisticware/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://gitlab.com/moljac-sport/judo.git"
export DIR="./personal-private/judo/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://gitlab.com/moljac-microsoft/microsoft.git"
export DIR="./personal-private/microsoft/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/katodix/ProjectStore.git"
export DIR="./katodix/ProjectStore/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR




export BRANCH="master"
export URL="https://gitlab.com/holisticware-education/tvz-cpp.git"
export DIR="./edu/borna/tvz-cpp/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/tompotola/LEGO-Mindstorms-EV3.git"
export DIR="./edu/jana-tompotola/LEGO-Mindstorms-EV3/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/tompotola/LEGO-Mindstorms-EV3.git"
export DIR="./edu/jana-tompotola/LEGO-Mindstorms-EV3/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/zunzo/matura.git"
export DIR="./edu/nina-zunzo-zunzetta/matura/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


cd $DIR_ROOT