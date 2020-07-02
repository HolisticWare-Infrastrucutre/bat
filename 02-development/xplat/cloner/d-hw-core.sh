#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/hw-core"
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


export BRANCH="master"
export URL="https://gitlab.com/holisticware-components/gcl.git"
export DIR="./01-gcl/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/HolisticWare/HolisticWare.Core.Text.git"
export DIR="./gh/221-HWC.Text/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/HolisticWare/HolisticWare.Core.IO.git"
export DIR="./gh/222-HWC.IO/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/holisticware/HolisticWare.Core.Serialization.git"
export DIR="./gh/31-HWC.Serialization/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/holisticware/HolisticWare.Core.Math.git"
export DIR="./gh/21-HWC.Math/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/holisticware/HolisticWare.Core.Math.Numerics.git"
export DIR="./gh/24-HWC.Math.Numerics/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/holisticware/HolisticWare.Core.Math.Statistics.git"
export DIR="./gh/25-HWC.Math.Statistics/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/holisticware/HolisticWare.Core.Math.Statistics.Descriptive.git"
export DIR="./gh/251-HWC.Math.Statistics.Descriptive/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/HolisticWare/HolisticWare.Core.Math.Statistics.Descriptive.Sequential.git"
export DIR="./gh/2511-HWC.Math.Statistics.Descriptive.Sequential/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/HolisticWare/HolisticWare.Core.Math.Matrix.git"
export DIR="./gh/261-HWC.Math.Matrix/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR



export BRANCH="master"
export URL="https://github.com/moljac/HolisticWare.Core.Math.Intervals.git"
export DIR="./gh/262-HWC.Math.Intervals/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR



export BRANCH="master"
export URL="https://github.com/moljac/HolisticWare.Core.Math.Polynomials.git"
export DIR="./gh/263-HWC.Math.Polynomials/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/moljac/HolisticWare.Core.Math.Sets.git"
export DIR="./gh/264-HWC.Math.Set/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://github.com/holisticware/HolisticWare.Core.Math.Discrete.GraphTheory.git"
export DIR="./gh/265-HWCMD.GraphTheory/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/holisticware/HolisticWare.Core.Math.Discrete.SetTheory.git"
export DIR="./gh/265-HWCMD.SetTheory/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR







export BRANCH="master"
export URL="https://gitlab.com/private-holisticware/holisticware-core/HolisticWare.Core.Math.ExpertSystems.git"
export DIR="./gl/HWC.Data.ExpertSystems/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://gitlab.com/holisticware-core/HolisticWare.Core.Graphics.Charting.git"
export DIR="./gl/HWCG.Charting/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://gitlab.com/holisticware-core/HolisticWare.Core.Graphics.SVG.git"
export DIR="./gl/HWCG.SVG/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR






cd $DIR_ROOT