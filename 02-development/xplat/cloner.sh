#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"
[ ! -d $DIR_ROOT ] && mkdir $DIR_ROOT

# Windows Subsystem For Linux path
export DIR_ROOT="/Users/Shared/Projects"
[ ! -d $DIR_ROOT ] && mkdir $DIR



export DIR="$DIR_ROOT/d"
[ ! -d $DIR ] && mkdir $DIR

#------------------------------------------------------------------------------
# Xamarin
export DIR="$DIR_ROOT/d/X"
[ ! -d $DIR ] && mkdir $DIR
cd $DIR

sh ./cloner/d-X-xamarin.sh

#------------------------------------------------------------------------------
# HolisticWare.Tools
export DIR="$DIR_ROOT/d/hw-tools"
[ ! -d $DIR ] && mkdir $DIR

sh ./cloner/d-hw-tools.sh

#------------------------------------------------------------------------------
# HolisticWare.Core
export DIR="$DIR_ROOT/d/hw-core"
[ ! -d $DIR ] && mkdir $DIR

sh ./cloner/d-hw-core.sh


#------------------------------------------------------------------------------
# HolisticWare.Core
export DIR="$DIR_ROOT/d/Samples"
[ ! -d $DIR ] && mkdir $DIR

sh ./cloner/d-Samples.sh

#------------------------------------------------------------------------------
# HolisticWare.Core
export DIR="$DIR_ROOT/d/Ph4ct3x"
[ ! -d $DIR ] && mkdir $DIR

sh ./cloner/d-Ph4ct3x.sh



