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
export DIR="AX"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR


export URL="https://github.com/Samples-Playgrounds/Samples.GooglePlayServices-Firebase-MLKit.git"
export BRANCH="master"
export DIR="GPS-FB-MLKit"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/moljac/Samples.GooglePlayServices-Firebase"
export BRANCH="master"
export DIR="GPS-FB-MLKit-blocked"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.MachineLearning.git"
export BRANCH="master"
export DIR="MachineLearning"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.Cake.git"
export BRANCH="master"
export DIR="Cake"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.MAUI.git"
export BRANCH="main"
export DIR="MAUI"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.Xamarin.Forms.git"
export BRANCH="master"
export DIR="Xamarin.Forms"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.CSharp.git"
export BRANCH="master"
export DIR="CSharp"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.R.git"
export BRANCH="main"
export DIR="R"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.Julia.git"
export BRANCH="main"
export DIR="Julia"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.MatlabOctave.git"
export BRANCH="main"
export DIR="MatlabOctave"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.Python.git"
export BRANCH="main"
export DIR="Python"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/Samples-Playgrounds/Samples.FormalLanguages.Parsers.git"
export BRANCH="main"
export DIR="FormalLanguages.Parsers"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

