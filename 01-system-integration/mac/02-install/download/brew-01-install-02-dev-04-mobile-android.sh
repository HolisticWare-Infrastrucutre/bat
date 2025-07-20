#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install


brew  doctor
brew  cleanup  


brew $ACTION_VERB \
    --cask \
    android-sdk \
    android-platform-tools \
    android-ndk \



brew $ACTION_VERB \
    --cask \
    android-studio \
    android-file-transfer \
    androidtool \



ls -al $HOME/Library/Android/sdk/


sdkmanager "system-images;android-31;google_apis;x86_64"

avdmanager create avd -n my_android_31 -k "system-images;android-31;google_apis;x86_64"

