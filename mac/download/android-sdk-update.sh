#!/bin/bash

android list sdk --all

PACKAGES=\
"\
    tools \
    platform-tools \
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


PACKAGES_LIST=

for PACKAGE in $PACKAGES;
do
    PACKAGES_LIST="${PACKAGES_LIST},${PACKAGE}"

    echo $PACKAGE
    echo $PACKAGES_LIST
done

echo $PACKAGES_LIST

PACAKES_LIST=

ANDROID=tools/android
( sleep 5 && while [ 1 ]; do sleep 1; echo y; done ) \
    | \
    $ANDROID update sdk \
        --no-ui \
        --all \
        --filter \
            ${PACKAGES_LIST}

