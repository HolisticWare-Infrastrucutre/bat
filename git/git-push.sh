#!/bin/bash

DIR_CURRENT=$(pwd)

echo $DIR_CURRENT

for DIR in $(ls);
do
    echo $DIR
    cd $DIR
    git push --recurse-submodules=on-demand
    git submodule foreach git push origin master
    cd ..
done

