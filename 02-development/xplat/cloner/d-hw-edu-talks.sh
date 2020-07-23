#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/hw-edu"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

mkdir gh
mkdir gl

export BRANCH="master"
export URL=""
export DIR=""


export BRANCH="master"
export URL="https://gitlab.com/holisticware-education/tvz-cpp.git"
export DIR="./gl/tvz-cpp/"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

# https://github.com/moljac/HolisticWare.Talks.git
# https://github.com/moljac/HolisticWare.Talks.CASE25.git
# https://github.com/moljac/HolisticWare.Talks.Algebra201312.git
# https://github.com/moljac/HolisticWare.Talks.CASE26.git
# https://github.com/moljac/HolisticWare.Talks.CASE27.git
# https://github.com/moljac/HolisticWare.Talks.KulenDayz2016.git
# https://github.com/moljac/HolisticWare.Talks.MobilityDay.2016.git
# https://github.com/moljac/HolisticWare.Talks.ChangeCon16.git
# https://github.com/moljac/HolisticWare.Talks.MSNetwork6.2016.git
# https://gitlab.com/holisticware-talks-presentations/holisticware.talks.presentations.ideas.private.git
# https://github.com/tpetrina/XamarinHackDay2014.git
# https://github.com/moljac/HolisticWare.Talks.MobilityDay.2015.git
# https://github.com/katodix/Texts-in-Progress.git





cd $DIR_ROOT