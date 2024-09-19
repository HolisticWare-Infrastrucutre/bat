#!/bin/bash

# https://mkyong.com/java/how-to-install-java-on-mac-osx/

java -version 
javac -version

winget install `
    microsoft.openjdk
winget install `
    microsoft.openjdk.8
winget install `
    microsoft.openjdk.11

