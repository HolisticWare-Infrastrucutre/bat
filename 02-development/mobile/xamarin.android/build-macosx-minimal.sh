#!/bin/bash

# build-macosx-minimal.sh

export ANDROID_SDK_ROOT=$HOME/Library/Developer/Xamarin/android-sdk-macosx
export AndroidSdkDirectory=
brew tap xamarin/xamarin-android-windeps    
[ -d ./xamarin-android/ ] && rm -fr ./xamarin-android/
git clone https://github.com/xamarin/xamarin-android.git
cd xamarin-android/
make prepare 
make
