
adb shell pm list packages    -f
adb shell pm list packages -3 -f

PACKAGES=\
"
Mono.Android.Platform.ApiLevel_25
Mono.Android.DebugRuntime
"
for PACKAGE in $PACKAGES;
do

    adb uninstall $PACKAGE
    pm uninstall $PACKAGE
    adb shell am start -a android.intent.action.DELETE -d package:$PACKAGE
    adb shell pm uninstall -k $PACKAGE

    adb shell am start -a android.intent.action.UNINSTALL_PACKAGE -d "package:$PACKAGE"
    adb shell am start -n com.android.packageinstaller/.UninstallerActivity -d "package:$PACKAGE"
    adb shell am start -a android.intent.action.DELETE -d "package:$PACKAGE"

done

