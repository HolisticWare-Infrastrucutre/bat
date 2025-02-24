#!/bin/bash

# "$(dirname "$0")/A.sh"
# ${0##*/}
# "$(dirname "${BASH_SOURCE[0]}")/emulators-data-names.sh"
source "$(dirname "$0")/emulators-data-names.sh"

export AVDMANAGER=$HOME/Library/Android/sdk/cmdline-tools/11.0/bin/avdmanager

export JAVA_HOME=$JAVA_HOME_JDK_21

echo \
"
        $AVDMANAGER \\
            --verbose \\
                delete avd \\
                --n $EMULATOR_NAME_ROOT-$EMULATOR \\

"

for EMULATOR in $EMULATORS;
do
    echo "=============================================================================================================="
    echo "AVD: $EMULATOR"

        $AVDMANAGER \
            --verbose \
                delete avd \
                -n $EMULATOR_NAME_PREFIX-$EMULATOR \

done

rm -fr  $HOME/.android/avd/**
 
export JAVA_HOME=$JAVA_HOME_JDK_11

