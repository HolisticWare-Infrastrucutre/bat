#!/bin/bash

sudo rm -rf /Developer/MonoDroid
rm -rf ~/Library/MonoAndroid
sudo pkgutil --forget com.xamarin.android.pkg
sudo rm -rf /Library/Frameworks/Xamarin.Android.framework

~/Library/Developer/Xamarin/*

To remove any Android AVDs and additional Android components, use the following command:

rm -rf ~/.android
To remove only the Android AVDs, use the following command:

rm -rf ~/.android/avd




