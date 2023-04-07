#!/bin/bash


sudo rm -rf "/Applications/Xamarin Studio.app"
sudo rm -fr "/Library/Frameworks/Xamarin.*"

rm -fr "$HOME/Library/Xamarin/"
rm -rf "$HOME/Library/XamarinStudio-*"
rm -fr "$HOME/Library/Developer/Xamarin/"

rm -rf "$HOME/Library/Caches/XamarinStudio-*"

rm -rf "$HOME/Library/Preferences/XamarinStudio-*"
rm -fr "$HOME/Library/Preferences/Xamarin/"

rm -rf "$HOME/Library/Logs/XamarinStudio-*"


export FRAMEWORKS=\
"
Xamarin.Android
Xamarin.iOS
Xamarin.Mac
Xamarin.Interactive
"

export TARGETS_APPLICATIONS=\
"
Visual\ Studio
Visual\ Studio\ (Preview)
Xamarin.Workbooks
"

for LIBRARY_FRAMEWORK in $FRAMEWORKS; 
do
    echo "Library Framework" "$LIBRARY_FRAMEWORK"
    echo "                    /Library/Frameworks/$LIBRARY_FRAMEWORK/"
    echo "/Library/Frameworks/$LIBRARY_FRAMEWORK/"
    # sudo rm -fr "/Library/Frameworks/$LIBRARY_FRAMEWORK/"
done

for APPLICATION in $FRAMEWORKS; 
do
    echo "Application: " "$APPLICATION"
    echo "             /Applications/$APPLICATION/"
    echo "/Library/Frameworks/$LIBRARY_FRAMEWORK/"
    # sudo rm -fr "/Library/Frameworks/$LIBRARY_FRAMEWORK/"
done


