#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install


# Android SDK

# https://dev.to/mhrastegari/develop-net-maui-apps-using-vs-code-without-traditional-ides-2l51

# https://gist.github.com/samkhawase/5e7c5a7a6d70d21c71416bd0c046f1e5

brew \
    $ACTION_VERB \
        --formula \
            gradle \
            ant \
            maven \

brew \
    $ACTION_VERB \
        --formula \
            adb-enhanced \
            apktool \
            bundletool \
            dex2jar \
            gifcap \
            gnirehtet \
            purr \
            redex \
            scrcpy \


brew \
    $ACTION_VERB \
        --cask \
            android-sdk \
            android-ndk \
            android-commandlinetools \
            android-platform-tools \

brew \
    $ACTION_VERB \
        --cask \
            android-studio \
            android-studio-preview@beta \
            android-studio-canary@canary \
