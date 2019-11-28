#!/bin/bash

brew update
brew tap homebrew/cask-versions
brew tap adoptopenjdk/openjdk

brew search java   
brew search jdk     
brew cask info java
brew cask info adoptopenjdk

brew cask install java
brew cask install homebrew/cask-versions/java11

brew tap homebrew/cask-versions
brew update
brew tap adoptopenjdk/openjdk
brew cask install adoptopenjdk8
brew cask install adoptopenjdk9
brew cask install adoptopenjdk10
brew cask install adoptopenjdk11

code -n Library/Java/JavaVirtualMachines/

/usr/libexec/java_home -V



ls -al /Library/Java/JavaVirtualMachines/

sudo \
    ln -s \
        /Users/Shared/Projects/system-installed/macosx/jdk/microsoft_dist_openjdk_8.0.25/ \
        /Library/Java/JavaVirtualMachines/microsoft_dist_openjdk_8.0.25

ls -al /Library/Java/JavaVirtualMachines/
export JAVA_HOME=/Library/Java/JavaVirtualMachines/microsoft_dist_openjdk_8.0.25
java -version