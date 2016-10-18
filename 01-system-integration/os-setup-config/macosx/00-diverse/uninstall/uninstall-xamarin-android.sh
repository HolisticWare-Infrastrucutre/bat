#!/bin/bash

sudo rm -rf /Developer/MonoDroid
sudo rm -rf ~/Library/MonoAndroid
sudo pkgutil --forget com.xamarin.android.pkg
sudo rm -rf /Library/Frameworks/Xamarin.Android.framework

sudo rm -fr ~/Library/Developer/Xamarin/android-sdk-macosx
sudo rm -fr ~/Library/Developer/Xamarin/android-ndk

