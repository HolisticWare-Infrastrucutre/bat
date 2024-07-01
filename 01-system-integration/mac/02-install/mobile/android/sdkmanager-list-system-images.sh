#!/bin/bash

# https://gist.github.com/mrk-han/66ac1a724456cadf1c93f4218c6060ae

# java 8 is required
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
sdkmanager --list | grep system-images
export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft-11.jdk/Contents/Home/
