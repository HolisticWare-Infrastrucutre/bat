#!/bin/bash

# java 8 is required
export JAVA_HOME=$JAVA_HOME_8 ; echo $JAVA_HOME 

sdkmanager

# https://gist.github.com/mrk-han/66ac1a724456cadf1c93f4218c6060ae

export AVD_DEVICES=\
"
pixel
pixel_c
pixel_xl
Tablet
"

export EMULATOR_NAME_PREFIX_34="emulator-arm-v8a-google-apis-android-34"
export EMULATOR_NAME_PREFIX_35="emulator-arm-v8a-google-apis-android-35"

export EMULATORS=\
"
emulator-android-34-google-apis-arm-v8a-Tablet
emulator-android-34-google-apis-arm-v8a-pixel
emulator-android-34-google-apis-arm-v8a-pixel_c
emulator-android-34-google-apis-arm-v8a-pixel_xl
"



export JAVA_HOME=$JAVA_HOME_JDK_11


#   android list target
#   android list avd
#   android list device
#   android create avd
#   android move avd
#   android delete avd
#   android list sdk
#   android update sdk
#   
#   
#   touch ~/.android/repositories.cfg
#   yes | sdkmanager --licenses
#   sdkmanager --update
#   sdkmanager --no_https --install emulator
#   sdkmanager --no_https --install platform-tools
#   sdkmanager --no_https --install "system-images;android-34;google_apis;arm64-v8a"
#   sdkmanager --no_https --install 'extras;intel;Hardware_Accelerated_Execution_Manager'
#   sdkmanager --no_https --install 'build-tools;29.0.2'
#   sdkmanager --no_https --install 'platforms;android-29'
#   sdkmanager --list
