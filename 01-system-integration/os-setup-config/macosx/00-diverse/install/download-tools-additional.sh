#!/bin/bash

URLS=\
"\
    http://member.ipmu.jp/yuji.tachikawa/MenuMetersElCapitan/zips/MenuMeters_1.9.2.zip \
	http://joel.barriere.pagesperso-orange.fr/download/1012/OnyX.dmg \
	http://joel.barriere.pagesperso-orange.fr/download/1012/Maintenance.dmg \
	
"    
    
    
for URL in $URLS; 
do
    echo item: $URL
    curl -v -L -C - -O $URL

done
    
open /System/Library/PreferencePanes/Trackpad.prefPane/
open /System/Library/PreferencePanes/Keyboard.prefPane/



    # https://download.xamarin.com/inspector/XamarinInteractive.msi 
    # https://download.xamarin.com/profiler/profiler-windows.msi
    
        