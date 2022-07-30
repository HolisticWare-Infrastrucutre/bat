#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/X/maui"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export URL=""
export BRANCH="master"
export DIR=""


export URL="https://github.com/dotnet/maui.git"
export BRANCH="main"
export DIR="dotnet/maui/m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/jsuarezruiz/awesome-dotnet-maui.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/drasticactions/WeatherTwentyTwo.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/davidortinau/WeatherTwentyOne.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/dotnet/maui-samples.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/rachelkang/recipeSearch.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/naweed/MauiScientificCalculator.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/jsuarezruiz/dotnet-maui-samples.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/brminnick/HackerNews.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/microsoft/dotnet-podcasts.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/dotnet-presentations/dotnet-maui-workshop.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/StoicDreams/BlazorUI.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/BlazorComponent/MASA.Blazor.git"
export BRANCH="main"
export DIR="m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recurse-submodules \
        -j8 \
        --branch $BRANCH \
        $URL \
        $DIR

















cd $DIR_ROOT