#!/bin/bash

export PATH=~/Library/Developer/Xamarin/android-sdk-macosx/tools/bin/:$PATH
export ANDROID=~/Library/Developer/Xamarin/android-sdk-macosx/tools/android
export SDKMANAGER=~/Library/Developer/Xamarin/android-sdk-macosx/tools/bin/sdkmanager

#====================================================================
# listing android SDK packages
#
# https://developer.android.com/studio/command-line/sdkmanager.html
#
# $SDKMANAGER --list
#--------------------------------------------------------------------
# short version 
# $ANDROID list sdk --all 
#
# longer version with package names
# $ANDROID list sdk --all --extended
#
# longer version with package names with 
# $ANDROID list sdk --all --extended | grep "or "
#====================================================================

# formatting is just for easier/faster manual editing

configure_with_tools_sdkmanager()
{
export PACKAGES_TO_UNINSTALL=\
"\
"
export PACKAGES_TO_INSTALL=\
"\
"

export PACKAGES_TO_UPDATE=\
"\
"
"}

configure_with_tools_android()
{
export PACKAGES_TO_UNINSTALL=\
"\
	doc-24 \
"
export PACKAGES_TO_INSTALL=\
"\
    tools \
"

export PACKAGES_TO_UPDATE=\
"\
    tools \
    platform-tools \
    build-tools-25.0.2 \
    build-tools-25.0.1 \
    build-tools-25.0.0 \
    build-tools-25.0.0 \
    build-tools-24.0.3 \
    build-tools-24.0.2 \
    build-tools-24.0.1 \
    build-tools-24.0.0 \
    build-tools-23.0.3 \
    build-tools-23.0.2 \
    build-tools-23.0.1 \
    build-tools-23.0.0 \
"
}
