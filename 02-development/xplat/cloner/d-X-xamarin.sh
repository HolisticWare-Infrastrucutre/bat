#!/bin/bash

cd /Users/Shared/Projects

mkdir ./X

cd 
git clone \
    --recursive \
    --branch master \
    https:/github.com/xamarin/AndroidX.git \
    AndroidX-master/ \

export BRANCH="master"
git clone \
    --recursive \
    --branch $BRANCH \
    https:/github.com/xamarin/AndroidX.git \
    AX[]m/ \

export BRANCH="master_based_updates_202001"
git clone \
    --recursive \
    --branch $BRANCH \
    https:/github.com/xamarin/AndroidX.git \
    ./AX[]$BRANCH/
cd ./AX[]$BRANCH/ && git checkout && cd -

git clone \
    --recursive \
    --branch $BRANCH \
    ./monodroid-samples[]ax/ \
    https:/github.com/moljac/monodroid-samples.git

export BRANCH="master"
git clone \
    --recursive \
    --branch $BRANCH \
    ./GPS-FB[]]m/ \
    https:/github.com/xamarin/GooglePlayServicesComponents.git

export BRANCH="master_based_androidx"
git clone \
    --recursive \
    --branch $BRANCH \
    https:/github.com/xamarin/GooglePlayServicesComponents.git \
    ./GPS-FB[]]ax/ \

export BRANCH="master"
git clone \
    --recursive \
    --branch $BRANCH \
    https:/github.com/xamarin/AndroidSupportComponents.git \
    ./AS[]m]/

git clone \
    --recursive \
    https:/github.com/xamarin/XamarinAndroidXMigration.git \
    ./XamarinAndroidXMigration/

git clone \
    --recursive \
    https:/github.com/xamarin/java.interop \
    ./java.interop




