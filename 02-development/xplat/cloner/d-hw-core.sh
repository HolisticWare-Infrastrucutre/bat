#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/hw-core"
[ ! -d $DIR ] && echo "Folder $DIR does not exists. Exiting ..." && exit 

[ -d $DIR ] && cd $DIR

export URL=""
export BRANCH="master"
export DIR=""


