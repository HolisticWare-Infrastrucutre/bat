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

export BRANCH="master"
export URL="https://github.com/shinyorg/shinysamples.git"
export DIR="./gh/diverse/shinysamples/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/xamarin/Essentials.git"
export DIR="./gh/diverse/Essentials/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/NeilMalcolm/Xamarin.Forms-Alarm-App"
export DIR="./gh/diverse/AlarmApp/"
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
export DIR="./gl/Ph4ct3x.Docs.Private/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://gitlab.com/holisticware-applications/holisticware.ph4ct3x.heartratemonitors.git"
export DIR="./gl/Ph4ct3x.HRMs/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR



export BRANCH="master"
export URL="https://github.com/HolisticWare/HolisticWare.Core.Math.Intervals.git"
export DIR="./gh/core/Intervals/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/HolisticWare/HolisticWare.Core.Math.Numerics.git"
export DIR="./gh/core/Numerics/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/HolisticWare/HolisticWare.Core.Math.Polynomials.git"
export DIR="./gh/core/Polynomials/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/HolisticWare/HolisticWare.Core.Math.Statistics.Descriptive.Sequential.git"
export DIR="./gh/core/Statistics/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/HolisticWare/HolisticWare.Core.Text.git"
export DIR="./gh/core/Text/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/moljac/HolisticWare.Core.Math.Samples.git"
export DIR="./gh/core/Math.Samples/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://gitlab.com/holisticware-bindings/Garmin.ConnectIQ.git"
export DIR="./gl/bindings/Garmin.ConnectIQ/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://gitlab.com/holisticware-bindings/polar.git"
export DIR="./gl/bindings/Polar/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://gitlab.com/holisticware-bindings/suunto.movesense.git"
export DIR="./gl/bindings/Suunto.Movesense/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


export BRANCH="master"
export URL="https://gitlab.com/holisticware-bindings/Samsung.git"
export DIR="./gl/bindings/Samsung/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://gitlab.com/holisticware-bindings/Jawbone.UP.git"
export DIR="./gl/bindings/Jawbone.UP/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

