#!/bin/bash

# "$(dirname "$0")/A.sh"
# ${0##*/}
# "$(dirname "${BASH_SOURCE[0]}")/emulators-data-names.sh"
source "$(dirname "$0")/emulators-data-names.sh"

# java 8 is required
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
java -version

echo \
"
    echo "no" \\
        | \\
        avdmanager \\
            --verbose \\
                create avd \\
                --force \\
                --name $EMULATOR_NAME_PREFIX-$EMULATOR \\
                --device "$EMULATOR" \\
                --package "system-images\;android-34\;google_apis\;arm64-v8a" \\
                --tag "google_apis" \\
                --abi "arm64-v8a" \\

"

IFS=$'\n'
# ZSH does not split words by default (like other shells):
setopt sh_word_split

for EMULATOR in $EMULATORS;
do
    echo "=============================================================================================================="
    echo "AVD: $EMULATOR"

    echo "no" \
        | \
        avdmanager \
            --verbose \
                create avd \
                --force \
                --name $EMULATOR_NAME_PREFIX-$EMULATOR \
                --device "$EMULATOR" \
                --package "system-images;android-34;google_apis;arm64-v8a" \
                --tag "google_apis" \
                --abi "arm64-v8a" \

done

export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home/

for EMULATOR in $EMULATORS;
do
    dev_android_emulator_launch $EMULATOR_NAME_PREFIX-$EMULATOR
done

