#!/bin/bash

export TARGETS_LIBRARY_FRAMEWORKS=\
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

for LIBRARY_FRAMEWORK in $TARGETS_LIBRARY_FRAMEWORKS; 
do
    echo "Library Framework" "$LIBRARY_FRAMEWORK"
    echo "                    /Library/Frameworks/$LIBRARY_FRAMEWORK/"
    echo "/Library/Frameworks/$LIBRARY_FRAMEWORK/"
    # sudo rm -fr "/Library/Frameworks/$LIBRARY_FRAMEWORK/"
done

for APPLICATION in $TARGETS_LIBRARY_FRAMEWORKS; 
do
    echo "Application: " "$APPLICATION"
    echo "             /Applications/$APPLICATION/"
    echo "/Library/Frameworks/$LIBRARY_FRAMEWORK/"
    # sudo rm -fr "/Library/Frameworks/$LIBRARY_FRAMEWORK/"
done


