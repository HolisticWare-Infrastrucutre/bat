#!/bin/bash

find .\
    build-tools \
    samples \
    src \
    src-ThirdParty \
    tests \
    tools \
    -type d \
    \( -name "bin" -o -name "obj" \) -exec rm -fr {} \;

