#!/bin/bash

cd /Users/Shared/Projects

mkdir ./X

git clone --recursive \
    https:/github.com/xamarin/AndroidX.git \
    ./X/AndroidX-master/

export BRANCH="master_based_updates_202001"
git clone --recursive \
    https:/github.com/xamarin/AndroidX.git \
    ./X/AndroidX-$BRANCH/
cd ./X/AndroidX-$BRANCH/ && git checkout && cd -

git clone --recursive \
    https:/github.com/xamarin/XamarinAndroidXMigration.git \
    ./X/XamarinAndroidXMigration/

git clone --recursive \
    https:/github.com/xamarin/java.interop

git clone --recursive \
    https:/github.com/xamarin/GoogleApisForiOSComponents.git \
    ./X/GoogleApisForiOSComponents

git clone --recursive \
    https:/github.com/moljac/monodroid-samples.git \
    ./X/monodroid-samples/

git clone --recursive \
    https:/github.com/xamarin/GooglePlayServicesComponents.git \
    ./X/GPS-FB-master/

export BRANCH="master_based_androidx"
git clone --recursive \
    https:/github.com/xamarin/GooglePlayServicesComponents.git \
    ./X/GPS-FB-$BRANCH/

git clone --recursive \
    https:/github.com/xamarin/AndroidSupportComponents.git
    ./X/AndroidSupportComponents-master/

