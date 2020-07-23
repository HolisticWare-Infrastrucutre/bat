#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"
[ ! -d $DIR_ROOT ] && mkdir $DIR_ROOT

export DIRECTORIES=\
'
./d
./d/hw-tools
./d/Ph4ct3x
./d/Ph4ct3x/gh/
./d/Ph4ct3x/gl/
./d/HW
./d/bin
./d/corefx
./d/x.e
./d/hw-bindings
./d/hw-core
./d/hw-xa
./d/Samples
./d/system-installed
./d/ASP.net
./d/xm-nuget
./d/X.tmp
./d/x.a
./d/xs-nuget
./d/tmp
./d/system-installed
./d/X
./d/X.tmp
./d/hw-xe
./e
./e/personal
./e/hw-talks
./e/Commercial
'


while IFS= read -r D
do
    echo "custom folder: " $D
    echo "                 $DIR_ROOT/$D"

    [ ! -d "$DIR_ROOT/$D" ] && mkdir "$DIR_ROOT/$D"
done \
<<< "$DIRECTORIES"









