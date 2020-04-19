#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"
[ ! -d $DIR_ROOT ] && mkdir $DIR

# Windows Subsystem For Linux path
export DIR_ROOT="/Users/Shared/Projects"
[ ! -d $DIR_ROOT ] && mkdir $DIR



export DIR="$DIR_ROOT/d"
[ ! -d $DIR ] && mkdir $DIR

export DIR="$DIR_ROOT/d/X"
[ ! -d $DIR ] && mkdir $DIR

export DIR="$DIR_ROOT/d/hw-core"
[ ! -d $DIR ] && mkdir $DIR

export DIR="$DIR_ROOT/d/hw-tools"
[ ! -d $DIR ] && mkdir $DIR

export DIR="$DIR_ROOT/e"
[ ! -d $DIR ] && mkdir $DIR


sh cloner/X-xamarin.sh

