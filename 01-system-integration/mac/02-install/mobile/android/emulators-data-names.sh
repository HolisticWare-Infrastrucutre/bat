#!/bin/bash

# java 8 is required
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

export EMULATORS=\
"
pixel
pixel_c
pixel_xl
"

sdkmanager --list
sdkmanager --update

# need to download the image with sdkmanager
sdkmanager "system-images;android-34;google_apis;arm64-v8a"

export EMULATOR_NAME_PREFIX="emulator-android-34-google-apis-arm-v8a"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home/

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
#   # sdkmanager --no_https --install 'extras;intel;Hardware_Accelerated_Execution_Manager'
#   sdkmanager --no_https --install 'build-tools;29.0.2'
#   sdkmanager --no_https --install 'platforms;android-29'
#   sdkmanager --list