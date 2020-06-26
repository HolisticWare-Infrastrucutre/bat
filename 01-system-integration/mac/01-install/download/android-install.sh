#!/bin/bash

brew cask info \
    android-sdk
brew cask info \
    java


brew cask install \
    homebrew/cask-versions/adoptopenjdk8

sdkmanager --update

sdkmanager \
    "platform-tools" \
    "platforms;android-7" \
    "platforms;android-8" \
    "platforms;android-9" \
    "platforms;android-10" \
    "platforms;android-11" \
    "platforms;android-12" \
    "platforms;android-13" \
    "platforms;android-14" \
    "platforms;android-15" \
    "platforms;android-16" \
    "platforms;android-17" \
    "platforms;android-18" \
    "platforms;android-19" \
    "platforms;android-20" \
    "platforms;android-21" \
    "platforms;android-22" \
    "platforms;android-23" \
    "platforms;android-24" \
    "platforms;android-25" \
    "platforms;android-26" \
    "platforms;android-27" \
    "platforms;android-28" \
    "platforms;android-29" \
    "platforms;android-30" \
    "ndk;21.3.6528147" \
    "build-tools;30.0.0" \
    "build-tools;29.0.3" \
    "build-tools;28.0.3" \
    "build-tools;27.0.3" \
    "build-tools;26.0.3" \
    "build-tools;25.0.3" \
    "build-tools;24.0.3" \
    "build-tools;23.0.3" \
    "build-tools;22.0.1" \
    "build-tools;21.1.2" \
    "build-tools;20.0.0" \
    "build-tools;19.1.0" \
    "extras;google;m2repository" \
    "extras;android;m2repository" \
    "extras;google;auto" \
    "extras;google;google_play_services" \
    "extras;google;instantapps" \
    "extras;google;m2repository" \
    "extras;google;market_apk_expansion" \
    "extras;google;market_licensing" \
    "extras;google;simulators" \
    "extras;google;webdriver" \
    "patcher;v4" \
    "cmake;3.10.2.4988404" \
    "cmdline-tools;latest" \
    "add-ons;addon-google_apis-google-15" \
    "add-ons;addon-google_apis-google-16" \
    "add-ons;addon-google_apis-google-17" \
    "add-ons;addon-google_apis-google-18" \
    "add-ons;addon-google_apis-google-19" \
    "add-ons;addon-google_apis-google-21" \
    "add-ons;addon-google_apis-google-22" \
    "add-ons;addon-google_apis-google-23" \
    "add-ons;addon-google_apis-google-24" \
    "system-images;android-10;default;x86" \
    "system-images;android-10;google_apis;x86" \
    "system-images;android-15;default;x86" \
    "system-images;android-15;google_apis;x86" \
    "system-images;android-16;default;x86" \
    "system-images;android-16;google_apis;x86" \
    "system-images;android-17;default;x86" \
    "system-images;android-17;google_apis;x86" \
    "system-images;android-18;default;x86" \
    "system-images;android-18;google_apis;x86" \
    "system-images;android-19;default;x86" \
    "system-images;android-19;google_apis;x86" \
    "system-images;android-21;android-tv;x86" \
    "system-images;android-21;default;x86" \
    "system-images;android-21;google_apis;x86" \
    "system-images;android-22;android-tv;x86" \
    "system-images;android-22;default;x86" \
    "system-images;android-22;google_apis;x86" \
    "system-images;android-23;android-tv;x86" \
    "system-images;android-23;android-wear;x86" \
    "system-images;android-23;default;x86" \
    "system-images;android-23;google_apis;x86" \
    "system-images;android-24;android-tv;x86" \
    "system-images;android-24;default;x86" \
    "system-images;android-24;google_apis;x86" \
    "system-images;android-24;google_apis_playstore;x86" \
    "system-images;android-25;android-tv;x86" \
    "system-images;android-25;android-wear;x86" \
    "system-images;android-25;default;x86" \
    "system-images;android-25;google_apis;x86" \
    "system-images;android-25;google_apis_playstore;x86" \
    "system-images;android-26;android-tv;x86" \
    "system-images;android-26;android-wear;x86" \
    "system-images;android-26;default;x86" \
    "system-images;android-26;google_apis;x86" \
    "system-images;android-26;google_apis_playstore;x86" \
    "system-images;android-27;android-tv;x86" \
    "system-images;android-27;default;x86" \
    "system-images;android-27;google_apis;x86" \
    "system-images;android-27;google_apis_playstore;x86" \
    "system-images;android-28;android-tv;x86" \
    "system-images;android-28;android-wear;x86" \
    "system-images;android-28;default;x86" \
    "system-images;android-28;google_apis_playstore;x86" \
    "system-images;android-28;google_ndk;x86" \
    "system-images;android-29;default;x86" \
    "system-images;android-29;google_apis;x86" \
    "system-images;android-29;google_apis_playstore;x86" \
    "system-images;android-30;google_apis;x86" \
    "system-images;android-30;google_apis_playstore;x86" \
    "system-images;android-Q;android-tv;x86" \


sdkmanager --license