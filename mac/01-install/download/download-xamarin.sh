#!/bin/bash

# publishURL

URLS=\
"\
    https://download.mono-project.com/archive/4.6.2/macos-10-universal/MonoFramework-MDK-4.6.2.16.macos10.xamarin.universal.pkg
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
    http://usa.maintain.se/Cocktail10SE.dmg \
    https://dl.xamarin.com/OpenJDK/mac/microsoft-dist-openjdk-1.8.0.9.zip \
    
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

cd /Users/$(whoami)/Downloads

for URL in $URLS; 
do
    echo item: $URL
    curl -v -L -C - -O $URL

done

git --version
# https://sourceforge.net/projects/git-osx-installer/files/
# URL="http://downloads.sourceforge.net/project/git-osx-installer/git-2.10.1-intel-universal-mavericks.dmg?r=https%3A%2F%2Fsourceforge.net%2Fprojects%2Fgit-osx-installer%2Ffiles%2F&ts=1480886198&use_mirror=netassist"
#curl -v -L -C - -O $URL

brew install git
git --version

sudo port selfupdate
port search git
port variants git
sudo port install git +bash_completion+credential_osxkeychain+doc
 
git config --global user.name "Miljenko Cvjetko moljac"
git config --global user.email "mcvjetko@holisticware.net"
    

open \
	https://chrome.google.com/webstore/detail/advanced-rest-client/hgmloofddffdnphfgcellkdfbfbjeloo/related
open \
	
