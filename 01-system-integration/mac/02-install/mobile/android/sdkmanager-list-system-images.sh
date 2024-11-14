#!/bin/bash

# https://gist.github.com/mrk-han/66ac1a724456cadf1c93f4218c6060ae

# java 8 is required
export JAVA_HOME=$JAVA_HOME_JDK_8

sdkmanager --list | grep system-images

export JAVA_HOME=$JAVA_HOME_JDK_11

