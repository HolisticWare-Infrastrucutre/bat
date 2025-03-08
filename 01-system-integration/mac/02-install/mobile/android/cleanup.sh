#!/bin/bash

# Android CleanUp

rm -Rf "/Applications/Android Studio.app"
rm -Rf $HOME/Library/Preferences/AndroidStudio*
rm -Rf $HOME/Library/Preferences/com.google.android.*
rm -Rf $HOME/Library/Preferences/com.android.*
rm -Rf $HOME/Library/Application\ Support/AndroidStudio*
rm -Rf $HOME/Library/Application\ Support/Google/AndroidStudio*
rm -Rf $HOME/Library/Logs/AndroidStudio*
rm -Rf $HOME/Library/Caches/AndroidStudio*
rm -Rf $HOME/.AndroidStudio*
rm -Rf $HOME/.gradle
rm -Rf $HOME/.android
rm -Rf $HOME/Library/Android*
rm -Rf /usr/local/var/lib/android-sdk/

# delete all projects:

rm -Rf $HOME/AndroidStudioProjects 


rm -Rf "/Applications/Android Studio.app"
rm -Rf "$HOME/Library/Preferences/AndroidStudio*"
rm -Rf "$HOME/Library/Preferences/com.google.android.*"
rm -Rf "$HOME/Library/Preferences/com.android.*"
rm -Rf "$HOME/Library/Application\ Support/AndroidStudio*"
rm -Rf "$HOME/Library/Logs/AndroidStudio*"
rm -Rf "$HOME/Library/Caches/AndroidStudio*"
rm -Rf "$HOME/.AndroidStudio*"
rm -Rf "$HOME/.gradle"
rm -Rf "$HOME/.android"
rm -Rf "$HOME/Library/Android*"
rm -Rf "/usr/local/var/lib/android-sdk/"
