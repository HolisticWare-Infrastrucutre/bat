#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/Samples-Playgrounds"
[ ! -d $DIR ] && echo "Folder $DIR does not exists. Exiting ..." && exit 

[ -d $DIR ] && cd $DIR

export URL=""
export BRANCH="master"
export DIR=""


export URL="https://github.com/Samples-Playgrounds/Samples.AndroidX.git"
export BRANCH="master"
export DIR="Samples.AX"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR


export URL="https://github.com/Samples-Playgrounds/Samples.GooglePlayServices-Firebase.git"
export BRANCH="master"
export DIR="Samples.GPS-FB"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.MachineLearning.git"
export BRANCH="master"
export DIR="Samples.ML"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.Cake.git"
export BRANCH="master"
export DIR="Samples.Cake"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.Xamarin.Forms.git"
export BRANCH="master"
export DIR="Samples.Xamarin.Forms"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.CSharp.git"
export BRANCH="master"
export DIR="Samples.CSharp"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.R.git"
export BRANCH="main"
export DIR="Samples.R"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.Julia.git"
export BRANCH="main"
export DIR="Samples.Julia"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.MatlabOctave.git"
export BRANCH="main"
export DIR="Samples.MatlabOctave"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.Python.git"
export BRANCH="main"
export DIR="Samples.Python"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

