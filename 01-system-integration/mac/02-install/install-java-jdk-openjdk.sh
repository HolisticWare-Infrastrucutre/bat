#!/bin/bash

# https://mkyong.com/java/how-to-install-java-on-mac-osx/

/usr/libexec/java_home -V
java -version 
javac -version

brew install --cask \
    java

brew tap adoptopenjdk/openjdk

usr/libexec/java_home -V

/usr/libexec/java_home -v1.8
/usr/libexec/java_home -v11


brew update
brew tap homebrew/cask-versions
brew tap adoptopenjdk/openjdk

brew search java   
brew search jdk     
brew info --cask \
    java \
    adoptopenjdk

brew cask install java
brew cask install homebrew/cask-versions/java11

brew tap homebrew/cask-versions
brew update
brew tap adoptopenjdk/openjdk
brew install --cask \
    adoptopenjdk8 \
    adoptopenjdk9 \
    adoptopenjdk10 \
    adoptopenjdk11 \
    adoptopenjdk13 \


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



# https://docs.microsoft.com/en-us/java/openjdk/download
# https://github.com/microsoft/openjdk/discussions

boots \
    https://aka.ms/download-jdk/microsoft-jdk-11.0.13.8.1-macOS-x64.pkg
boots \
    https://aka.ms/download-jdk/microsoft-jdk-16.0.2.7.1-macOS-x64.pkg
boots \
    https://aka.ms/download-jdk/microsoft-jdk-17.0.1.12.1-macOS-x64.pkg 



export JAVA_8_HOME=$(/usr/libexec/java_home -v1.8)
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)

alias java8='export JAVA_HOME=$JAVA_8_HOME'
alias java11='export JAVA_HOME=$JAVA_11_HOME'

unset JAVA_HOME;
export JAVA_HOME=$(/usr/libexec/java_home -v"11");
java -version

/usr/libexec/java_home -V
java -version 
javac -version

# ~/.zshrc

jdk() 
{
      version=$1
      unset JAVA_HOME;
      export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
      java -version
}
