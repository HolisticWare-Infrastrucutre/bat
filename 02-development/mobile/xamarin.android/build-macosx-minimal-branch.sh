#!/bin/bash


rm -fr xamarin-android-sdk-style-projects-02/
export ANDROID_SDK_ROOT=$HOME/Library/Developer/Xamarin/android-sdk-macosx
export AndroidSdkDirectory=
git clone \
    --branch migration-to-sdk-short-style-projects-02 \
    https://github.com/xamarin/xamarin-android.git \
    xamarin-android-sdk-style-projects-02

cd xamarin-android-sdk-style-projects-02/
make prepare && make


rm -fr xamarin-android-sdk-style-projects-03/
export ANDROID_SDK_ROOT=$HOME/Library/Developer/Xamarin/android-sdk-macosx
export AndroidSdkDirectory=
git clone \
    --branch migration-to-sdk-short-style-projects-03 \
    https://github.com/xamarin/xamarin-android.git \
    xamarin-android-sdk-style-projects-03

cd xamarin-android-sdk-style-projects-03/
make prepare && make
