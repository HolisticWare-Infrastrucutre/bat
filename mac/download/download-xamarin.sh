#!/bin/bash

# publishURL

URLS=\
"\
    https://go.microsoft.com/fwlink/?LinkID=620882 \
    https://www.visualstudio.com/thank-downloading-visual-studio-mac/?sku=vsmac \
    https://dl.google.com/android/android-sdk_r24.4.1-macosx.zip \
    https://dl.google.com/android/repository/android-ndk-r13b-darwin-x86_64.zip \
    https://store.xamarin.com/account/my/subscription/installer?os=mac \
    http://dl.xamarin.com/MonoTouch/Mac/xamarin.ios-10.2.0.4.pkg \
    https://store.xamarin.com/account/my/subscription/installer?os=mac \
    http://download.xamarin.com/MonoforAndroid/Mac/xamarin.android-7.0.1-2.pkg \
    https://store.xamarin.com/account/my/subscription/installer?os=mac \
    http://download.xamarin.com/XamarinforMac/Mac/xamarin.mac-2.10.0.103.pkg \
    https://store.xamarin.com/account/my/subscription/installer?os=mac \
    https://dl.xamarin.com/MonoDevelop/Mac/XamarinStudio-6.1.1.17.dmg \
    https://github.com/mono/monodevelop/archive/master.zip \
    https://download.xamarin.com/objective-sharpie/ObjectiveSharpie.pkg \
    https://download.xamarin.com/inspector/XamarinInteractive.pkg \
    https://dl.xamarin.com/interactive/XamarinInteractive.pkg \
    https://download.xamarin.com/profiler/profiler-mac.pkg \
    http://redth.info/assets/Xamarin.Studio.Launcher.v5.zip \
    http://download.mono-project.com/sources/monodevelop/monodevelop-6.0.0.4761.tar.bz2 \
    http://download.virtualbox.org/virtualbox/5.1.10/VirtualBox-5.1.10-112026-OSX.dmg \
    https://slack.com/ssb/download-osx \
    https://update.gitter.im/osx/latest \
"    
#
#     https://dl.xamarin.com/xamarin-simulator/Xamarin.Simulator.Installer.exe \
#    https://dl.xamarin.com/interactive/XamarinInteractive.msi \
#
#    http://download.xamarin.com/MonoTouch/Mac/xamarin.ios-10.0.1.8.pkg \
#    http://download.xamarin.com/MonoforAndroid/Mac/xamarin.android-7.0.1-2.pkg \
#    http://download.xamarin.com/XamarinforMac/Mac/xamarin.mac-2.10.0.103.pkg \
#    http://download.xamarin.com/studio/Mac/XamarinStudio-6.1.1.15-0.dmg \
#    http://download.mono-project.com/archive/4.6.1/macos-10-universal/MonoFramework-MDK-4.6.1.3.macos10.xamarin.universal.pkg \
    
# License Agreement needed
#    https://dl.google.com/dl/android/studio/install/2.2.2.0/android-studio-ide-145.3360264-mac.dmg \

for URL in $URLS; 
do
    echo item: $URL
    curl -v -L -C - -O $URL

done
    
