#!/bin/bash

# https://developer.android.com/studio/run/emulator-commandline
# https://developer.android.com/tools/avdmanager
# https://developer.android.com/tools/sdkmanager
# https://gist.github.com/mrk-han/66ac1a724456cadf1c93f4218c6060ae
# https://gist.github.com/cemo/6256fc41baa3914ace626fc7fe2cd955
# https://stackoverflow.com/questions/42792947/how-to-create-android-virtual-device-with-command-line-and-avdmanager

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
sdkmanager --list
sdkmanager --update
# recommendation always using the new 
#       google_atd 
# or 
#       aosp_atd 
#images when possible. 
# In some benchmarks, they are about 40% more efficient than the google_apis image.
# https://blog.emulator.wtf/posts/2022-04-15-atd-images/
export SYSTEM_IMAGE="system-images;android-34;google_atd;arm64-v8a"
# need to download the image with sdkmanager
sdkmanager $SYSTEM_IMAGE
sdkmanager --install $SYSTEM_IMAGE
export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home/
