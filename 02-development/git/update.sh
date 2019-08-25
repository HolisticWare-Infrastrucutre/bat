#!/bin/bash

DIR_CURRENT=$(pwd)

echo $DIR_CURRENT

for DIR in $(ls);
do
    echo $DIR
    cd $DIR
    git pull
    git pull --recurse-submodules
    git submodule foreach git pull origin master
    git submodule update --init --recursive
    git submodule update --remote --merge
    cd ..
done

