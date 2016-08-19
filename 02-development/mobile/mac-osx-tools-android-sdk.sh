#!/bin/bash

echo \
"\
export ANDROID_HOME=/Users/$USER/Library/Developer/Xamarin/android-sdk-macosx
export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools
" \
	>> \
	/Users/$USER/.profile


# ~/Library/Developer/Xamarin/android-sdk-macosx/platform-tools/
# ~/Library/Developer/Xamarin/android-sdk-macosx/platform-tools/

cat /Users/$USER/.profile