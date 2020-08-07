#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/Ph4ct3x"
[ ! -d $DIR ] && echo "Folder $DIR does not exists. Exiting ..." && exit 
[ -d $DIR ] && cd $DIR

mkdir gh/bt
mkdir gh/hrm

export URL=""
export BRANCH="master"
export DIR=""

export BRANCH="master"
export URL="https://github.com/inthehand/32feet.git"
export DIR="./gh/bt/32feet/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/moljac/Monkey.BluetoothLE.git"
export DIR="./gh/bt/Monkey.BluetoothLE/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://gitlab.com/kivusic/Timer.git"
export DIR="./gl/Timer/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export BRANCH="master"
export URL="https://github.com/AndyCW/MovesenseDotNet.git"
export DIR="./gh/hrm/MovesenseDotNet/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


https://github.com/shinyorg/shinysamples.git
https://github.com/HolisticWare/HolisticWare.Core.Math.Intervals.git
https://github.com/HolisticWare/HolisticWare.Core.Math.Numerics.git
https://github.com/HolisticWare/HolisticWare.Core.Math.Polynomials.git
https://github.com/HolisticWare/HolisticWare.Core.Math.Statistics.Descriptive.Sequential.git
https://github.com/HolisticWare/HolisticWare.Core.Text.git
https://github.com/moljac/HolisticWare.Core.Math.Samples.git
https://github.com/xamarin/Essentials.git
https://gitlab.com/holisticware-applications/holisticware.ph4ct3x.heartratemonitors.git
https://gitlab.com/holisticware-bindings/Garmin.ConnectIQ.git
https://gitlab.com/holisticware-bindings/Jawbone.UP.git
https://gitlab.com/holisticware-bindings/polar.git
https://gitlab.com/holisticware-bindings/Samsung.git
https://gitlab.com/holisticware-bindings/suunto.movesense.git
https://gitlab.com/holisticware-applications/holisticware.ph4ct3x.data.private.git
https://github.com/moljac/HolisticWare.Core.Math.Intervals.git
https://github.com/moljac/HolisticWare.Core.Math.Statistics.git

https://github.com/moljac/HolisticWare.Core.Math.Statistics.git
https://github.com/moljac/HolisticWare.Core.Math.Intervals.git
https://github.com/moljac/HolisticWare.Core.Math.Samples.git
https://github.com/moljac/HolisticWare.Core.Math.Statistics.Descriptive.Sequential.git
