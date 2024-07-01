#!/bin/bash

# https://developer.android.com/studio/run/emulator-commandline
# https://developer.android.com/tools/avdmanager
# https://developer.android.com/tools/sdkmanager
# https://gist.github.com/mrk-han/66ac1a724456cadf1c93f4218c6060ae
# https://gist.github.com/cemo/6256fc41baa3914ace626fc7fe2cd955
# https://stackoverflow.com/questions/42792947/how-to-create-android-virtual-device-with-command-line-and-avdmanager

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
avdmanager list avd
export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home/
