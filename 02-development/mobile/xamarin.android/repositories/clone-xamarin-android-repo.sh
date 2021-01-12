#!/bin/bash

# clone repo branch to folder

export BRANCH=migration-to-sdk-short-style-projects-xx
# export BRANCH=migration-to-sdk-short-style-projects-03

git clone \
    --branch $BRANCH \
    https://github.com/xamarin/xamarin-android.git \
    $BRANCH

cd $BRANCH

make prepare
make