@echo off


set ADB=..\android-sdk-windows\platform-tools\adb.exe


%ADB% remount
%ADB% push Vending.apk /system/app/
%ADB% push GoogleServicesFramework.apk /system/app/
%ADB% shell rm /system/app/SdkSetup.apk
%ADB% reboot
