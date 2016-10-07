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
"    
    
    
for URL in $URLS; 
do
    echo item: $URL
    curl -v -L -C - -O $URL

done
    



    # https://download.xamarin.com/inspector/XamarinInteractive.msi 
    # https://download.xamarin.com/profiler/profiler-windows.msi
    
        