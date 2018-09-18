#!/bin/bash

export PATH=~/Library/Developer/Xamarin/android-sdk-macosx/tools/bin/:$PATH
export ANDROID=~/Library/Developer/Xamarin/android-sdk-macosx/tools/android
export SDKMANAGER=~/Library/Developer/Xamarin/android-sdk-macosx/tools/bin/sdkmanager

. ./android-sdk-update-config.sh

$ANDROID --clear-cache
$SDKMANAGER --list

$SDKMANAGER --list >> list.sdkmanager.txt

for PACKAGE in $PACKAGES;
do
    PACKAGES_LIST="${PACKAGES_LIST},${PACKAGE}"

    echo $PACKAGE
    echo $PACKAGES_LIST
done

echo $PACKAGES_LIST

PACAKGES_LIST=


( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) \
    | \
    $ANDROID update sdk \
        --no-ui \
        --all \
        --filter \
            ${PACKAGES_LIST}

