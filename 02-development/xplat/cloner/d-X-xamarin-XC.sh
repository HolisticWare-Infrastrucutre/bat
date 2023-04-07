#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/X/XC"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export URL=""
export BRANCH="master"
export DIR=""



cd $DIR_ROOT