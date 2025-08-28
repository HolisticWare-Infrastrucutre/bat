#!/bin/bash

# "$(dirname "$0")/A.sh"
# ${0##*/}
# "$(dirname "${BASH_SOURCE[0]}")/emulators-data-names.sh"
source "$(dirname "$0")/emulators-data-names.sh"


export JAVA_HOME=$JAVA_HOME_JDK_21
java -version

echo EMULATOR_NAME_PREFIX_34=$EMULATOR_NAME_PREFIX_34
echo EMULATOR_NAME_PREFIX_35=$EMULATOR_NAME_PREFIX_35

export AVDMANAGER=$HOME/Library/Android/sdk/cmdline-tools/latest/bin/avdmanager

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for DEVICE in $AVD_DEVICES;
do
    echo "=============================================================================================================="
    echo "AVD"
    echo "      DEVICE: $DEVICE"

    if [[ $DEVICE == *"Tablet"* ]]; 
    then
        continue
    else
    fi

    echo \
    "
        $AVDMANAGER \\
            --verbose \\
                create avd \\
                --force \\
                --name $EMULATOR_NAME_PREFIX_34-$EMULATOR \\
                --device \"$DEVICE\" \\
                --package \"system-images;arm64-v8a;google_apis;android-34\" \\
                --tag \"google_apis\" \\
                --abi \"arm64-v8a\" \\
                    
        $AVDMANAGER \\
            --verbose \\
                create avd \\
                --force \\
                --name $EMULATOR_NAME_PREFIX_35-$EMULATOR \\
                --device \"$DEVICE\" \\
                --package \"system-images;arm64-v8a;google_apis;android-35\" \\
                --tag \"google_apis\" \\
                --abi \"arm64-v8a\" \\
    "

    echo "no" \
        | \
        $AVDMANAGER \
            --verbose \
                create avd \
                --force \
                --name $EMULATOR_NAME_PREFIX_34-$EMULATOR \
                --device "$DEVICE" \
                --package "system-images;android-34;google_apis;arm64-v8a" \
                --tag "google_apis" \
                --abi "arm64-v8a" \

    echo "no" \
        | \
        $AVDMANAGER \
            --verbose \
                create avd \
                --force \
                --name $EMULATOR_NAME_PREFIX_35-$EMULATOR \
                --device "$DEVICE" \
                --package "system-images;android-35;google_apis;arm64-v8a" \
                --tag "google_apis" \
                --abi "arm64-v8a" \


done

echo "no" \
    | \
    avdmanager \
        --verbose \
            create avd \
            --force \
            --name $EMULATOR_NAME_PREFIX-Tablet \
            --device 34 \
            --package "system-images;android-34;google_apis;arm64-v8a" \
            --tag "google_apis" \
            --abi "arm64-v8a" \


export JAVA_HOME=$JAVA_HOME_JDK_11

for EMULATOR in $EMULATORS;
do
    dev_android_emulator_launch $EMULATOR_NAME_PREFIX-$EMULATOR
done




    echo "no" \
        | \
        $AVDMANAGER \
                create avd \
                --force \
                --name emulator--arm-v8a-google-apis-android-35-pixel_c \
                --device "pixel_c" \
                --package "system-images;android-35;google_apis;arm64-v8a" \
                --tag "google_apis" \
                --abi "arm64-v8a" \

$AVDMANAGER \
    list avd

ll $HOME/.android/avd     