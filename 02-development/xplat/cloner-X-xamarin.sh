#!/bin/bash

cd /Users/Shared/Projects/d

mkdir ./X

export BRANCH="master"
git clone --recursive \
    --branch $BRANCH \
    https://github.com/xamarin/AndroidX.git \
    ./AX-m/


export BRANCH="master_based_updates_202001"
git clone --recursive \
    --branch $BRANCH \
    https://github.com/xamarin/AndroidX.git \
    ./AX-u202001/

export BRANCH="master_based_updates_202006"
git clone --recursive \
    --branch $BRANCH \
    https://github.com/xamarin/AndroidX.git \
    ./AX-u202006/

export BRANCH="master_based_fix_Material_TabLayout"
git clone --recursive \
    --branch $BRANCH \
    https://github.com/xamarin/AndroidX.git \
    ./AX-Material-TabLayout/






export BRANCH="master"
git clone --recursive \
    --branch $BRANCH \
    https://github.com/xamarin/GooglePlayServicesComponents.git \
    ./GPS-FB-m/

export BRANCH="master_based_androidx"
git clone --recursive \
    --branch $BRANCH \
    https://github.com/xamarin/GooglePlayServicesComponents.git \
    ./GPS-FB-ax/

export BRANCH="master_based_androidx_based_updates_202002"
git clone --recursive \
    --branch $BRANCH \
    https://github.com/xamarin/GooglePlayServicesComponents.git \
    ./GPS-FB-ax-u202002/

export BRANCH="master_based_androidx_based_updates_202005"
git clone --recursive \
    --branch $BRANCH \
    https://github.com/xamarin/GooglePlayServicesComponents.git \
    ./GPS-FB-ax-u202005/

export BRANCH="master_based_androidx_based_updates_202006"
git clone --recursive \
    --branch $BRANCH \
    https://github.com/xamarin/GooglePlayServicesComponents.git \
    ./GPS-FB-ax-u202006/








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

