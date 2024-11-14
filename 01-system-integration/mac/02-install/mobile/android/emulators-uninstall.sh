#!/bin/bash

# "$(dirname "$0")/A.sh"
# ${0##*/}
# "$(dirname "${BASH_SOURCE[0]}")/emulators-data-names.sh"
source "$(dirname "$0")/emulators-data-names.sh"

# java 8 is required
export JAVA_HOME=$JAVA_HOME_JDK_8

echo \
"
        avdmanager \\
            --verbose \\
                delete avd \\
                --n $EMULATOR_NAME_ROOT-$EMULATOR \\

"

for EMULATOR in $EMULATORS;
do
    echo "=============================================================================================================="
    echo "AVD: $EMULATOR"

        avdmanager \
            --verbose \
                delete avd \
                -n $EMULATOR_NAME_PREFIX-$EMULATOR \

done

export JAVA_HOME=$JAVA_HOME_JDK_11


for EMULATOR in $EMULATORS;
do
    dev_android_emulator_launch $EMULATOR_NAME_PREFIX-$EMULATOR
done

