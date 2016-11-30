#!/bin/bash

URLS=\
"\
    http://download.xamarin.com/MonoTouch/Mac/xamarin.ios-10.0.1.8.pkg \
    http://download.xamarin.com/MonoforAndroid/Mac/xamarin.android-7.0.1-2.pkg \
    http://download.xamarin.com/XamarinforMac/Mac/xamarin.mac-2.10.0.103.pkg \
    http://download.xamarin.com/studio/Mac/XamarinStudio-6.1.1.15-0.dmg \
    http://download.mono-project.com/archive/4.6.1/macos-10-universal/MonoFramework-MDK-4.6.1.3.macos10.xamarin.universal.pkg \
    https://download.xamarin.com/profiler/profiler-mac.pkg \
    https://download.xamarin.com/objective-sharpie/ObjectiveSharpie.pkg \
    https://download.xamarin.com/inspector/XamarinInteractive.pkg \
    http://redth.info/assets/Xamarin.Studio.Launcher.v5.zip \
    http://download.mono-project.com/sources/monodevelop/monodevelop-6.0.0.4761.tar.bz2 \
    https://github.com/mono/monodevelop/archive/master.zip \
    https://dl.google.com/dl/android/studio/install/2.2.2.0/android-studio-ide-145.3360264-mac.dmg \
    https://dl.google.com/android/android-sdk_r24.4.1-macosx.zip \
    https://dl.google.com/android/repository/android-ndk-r13b-darwin-x86_64.zip \
    http://download.virtualbox.org/virtualbox/5.1.10/VirtualBox-5.1.10-112026-OSX.dmg \
"    
    
    
for URL in $URLS; 
do
    echo item: $URL
    curl -v -L -C - -O $URL

done
    
