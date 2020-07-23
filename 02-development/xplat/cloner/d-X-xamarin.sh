#!/bin/bash

export DIR_ROOT="/Users/Shared/Projects"




export DIR="$DIR_ROOT/d/X"
[ ! -d $DIR ] && mkdir $DIR 
[ -d $DIR ] && cd $DIR

export URL=""
export BRANCH="master"
export DIR=""


export URL="https://github.com/xamarin/AndroidX.git"
export BRANCH="master"
export DIR="AX-m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/xamarin/AndroidX.git"
export BRANCH="master_based_20200328_media2_player_exoplayer_camera2"
export DIR="AX-media2_ExoPlayer"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/moljac/monodroid-samples.git"
export BRANCH="master_based_androidx"
export DIR="monodroid-samples-ax"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR


export URL="https://github.com/xamarin/GooglePlayServicesComponents.git"
export BRANCH="master"
export DIR="GPS-FB-m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/xamarin/GooglePlayServicesComponents.git"
export BRANCH="master_based_androidx"
export DIR="GPS-FB-ax"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR
    
export URL="https://github.com/xamarin/AndroidSupportComponents.git"
export BRANCH="master"
export DIR="AS-m"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/xamarin/XamarinAndroidXMigration.git"
export BRANCH="master"
export DIR="XamarinAndroidXMigration"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/xamarin/java.interop.git"
export BRANCH="master"
export DIR="java-interop"
[ ! -d $DIR ] \
    && \
    git clone \
        --recursive \
        --branch $BRANCH \
        $URL \
        $DIR

export URL="https://github.com/xamarin/Essentials.git"
export BRANCH="master"
export DIR="Essentials-m"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export URL="https://github.com/xamarin/net5-samples.git"
export BRANCH="master"
export DIR="net5-samples"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export URL="https://github.com/xamarin/Xamarin-Bindings.git"
export BRANCH="master"
export DIR="Customer-Xamarin-Bindings-m"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR

export URL="https://github.com/xamarin/XamarinUniversity.git"
export BRANCH="master"
export DIR="XamarinUniversity-m"
[ ! -d $DIR ] \
    && \
    git clone \
        --branch master \
        --recursive \
        $URL \
        $DIR


# ./X//gitlab[]xamarin-components/bond/.git/config:9:	url = https://github.com/Microsoft/bond.git
# ./X//gitlab[]xamarin-components/bond/.git/config:15:	url = https://github.com/miloyip/rapidjson.git
# ./X//gitlab[]xamarin-components/bond/.git/modules/thirdparty/rapidjson/config:10:	url = https://github.com/miloyip/rapidjson.git
# ./X//gitlab[]xamarin-components/bond/.git/modules/thirdparty/rapidjson/config:16:	url = https://chromium.googlesource.com/external/googletest.git
# ./X//gitlab[]xamarin-components/bond/.git/modules/thirdparty/rapidjson/modules/thirdparty/gtest/config:10:	url = https://chromium.googlesource.com/external/googletest.git
# ./X//Xamarin.EasyHttp/EasyHttp/.git/config:10:	url = https://github.com/hhariri/EasyHttp.git

dotnet tool uninstall -g cake.tool
dotnet tool uninstall -g xamarin.androidbinderator.tool 
dotnet tool uninstall -g xamarin.androidx.migration.tool 


dotnet tool install -g cake.tool
dotnet tool install -g xamarin.androidbinderator.tool 
dotnet tool install -g xamarin.androidx.migration.tool 


cd $DIR_ROOT