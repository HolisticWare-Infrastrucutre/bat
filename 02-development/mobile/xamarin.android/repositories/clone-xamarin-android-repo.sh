#!/bin/bash

# migration-to-sdk-short-style-projects-unix-distribution-setup
# migration-to-sdk-short-style-projects-create-vsix
# migration-to-sdk-short-style-projects-xabuild
# migration-to-sdk-short-style-projects-OpenTK
# migration-to-sdk-short-style-projects-
# migration-to-sdk-short-style-projects-
# migration-to-sdk-short-style-projects-



# clone repo branch to folder

export BRANCH=master
export FOLDER=migration-to-sdk-short-style-projects-xx
# export BRANCH=migration-to-sdk-short-style-projects-03

git clone \
    --branch $BRANCH \
    https://github.com/xamarin/xamarin-android.git \
    $FOLDER

cd $FOLDER

make prepare
make


