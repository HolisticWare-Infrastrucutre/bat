#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew  doctor
brew  cleanup  

#----------------------------------------------------------------------------------------------
# Development Java/Android
brew $ACTION_VERB \
    --formula \
        gradle \
        ant	\
        maven \
        jabba \
        jenv \
        cfr-decompiler \
        jadx \
        procyon-decompiler \
        smali \
        dex2jar \


brew $ACTION_VERB \
    --cask \
        android-ndk

#        android-sdk\


brew $ACTION_VERB \
    --cask \
        microsoft-openjdk@11 \
        microsoft-openjdk@17 \
        microsoft-openjdk@21 \
        microsoft-openjdk \


# Error: Could not find PKG source file 
# found 
# instead.        
# 
# Error: Could not find PKG source file 
#     'microsoft-jdk-11.0.25-macOS-aarch64.pkg', 
# found 
#     'microsoft-jdk-11.0.25-macos-aarch64.pkg' 
# instead.

export BREW_DOWNLOAD=$HOME/Library/Caches/Homebrew/downloads/

brew install \
    $BREW_DOWNLOAD/14caf32db3f58e886a8dc6cdc74d48bd03e6f697b661bd6c4555aea7586593ac--microsoft-jdk-17.0.15-macos-aarch64.pkg
brew install \
    $BREW_DOWNLOAD/924d21fd26825726cd6e6b4d6a65dc5e2d49712fe3a06f92f3d85bb85a3b2bcb--microsoft-jdk-21.0.7-macos-aarch64.pkg
brew install \
    $BREW_DOWNLOAD/ed92cd1b0f5d2533e54f0ec76241cb2348f57661c567ddeb97458a27146e19e5--microsoft-jdk-11.0.27-macos-aarch64.pkg


# https://stackoverflow.com/questions/52524112/how-do-i-$ACTION_VERB-java-on-mac-osx-allowing-version-switching

# https://github.com/Homebrew/homebrew-cask/blob/master/Casks/adoptopenjdk.rb
# https://github.com/AdoptOpenJDK/homebrew-openjdk/tree/master/Casks
# https://github.com/AdoptOpenJDK/homebrew-openjdk/blob/master/Casks/adoptopenjdk8.rb
# https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime
# https://bintray.com/jetbrains/intellij-jbr/jbrsdk11-osx-x64/818.2#files
# https://bintray.com/jetbrains/intellij-jbr/jbrsdk8-osx-x64/1644.3#files
# https://bintray.com/jetbrains/intellij-jbr
# https://bintray.com/jetbrains/intellij-jdk/
# https://bintray.com/jetbrains/intellij-jbr/jbrsdk8-osx-x64/1644.3#files





ll      /Library/Java/JavaVirtualMachines/
ls -1   /Library/Java/JavaVirtualMachines/ 

brew update

brew $ACTION_VERB \
    --formula \
        java11

brew $ACTION_VERB \
    --formula \
        openjdk \
        openjdk@8 \
        openjdk@11 \
        openjdk@17 \

brew $ACTION_VERB \
    --cask \
        adoptopenjdk \
        corretto \
        graalvm-jdk \
        microsoft-jdk \
        oracle-jdk \
        sapmachine-jdk \
        semeru-jdk-open \

ll      /Library/Java/JavaVirtualMachines/
ls -1   /Library/Java/JavaVirtualMachines/ 


brew tap homebrew/cask-versions

brew tap adoptopenjdk/openjdk

brew $ACTION_VERB \
    --cask \
        homebrew/cask-versions/adoptopenjdk8 \

brew $ACTION_VERB \
    --cask \
        adoptopenjdk/openjdk/adoptopenjdk8 \
        adoptopenjdk/openjdk/adoptopenjdk@11 \
        adoptopenjdk/openjdk/adoptopenjdk@17 \
        adoptopenjdk/openjdk/adoptopenjdk11 \
        adoptopenjdk/openjdk/adoptopenjdk17 \

brew $ACTION_VERB \
    --cask \
        adoptopenjdk \
        adoptopenjdk8 \
        adoptopenjdk/openjdk/adoptopenjdk8 \

brew untap adoptopenjdk/openjdk


brew $ACTION_VERB \
    --cask \
        homebrew/cask-versions/zulu8 \
        homebrew/cask-versions/zulu11 \
        homebrew/cask-versions/zulu17 \


brew $ACTION_VERB \
    --cask \
        microsoft-openjdk \
        microsoft-openjdk11 \

brew $ACTION_VERB \
    --cask \
        openjdk \
        openjdk@8 \
        openjdk@11 \
        openjdk@17 \
        openjdk@20 \


brew $ACTION_VERB \
    --cask \
        oracle-jdk \
        oracle-jdk \
        oracle-jdk17 \


brew $ACTION_VERB \
    --cask \
        semeru-jdk-open \
        semeru-jdk8-open \
        semeru-jdk11-open \
        semeru-jdk17-open \

brew $ACTION_VERB \
    --cask \
        graal-jdk \
        graal-jdk17 \

brew $ACTION_VERB \
    --cask \
        temurin \
        temurin@8 \
        temurin@11 \
        temurin@17 \
        temurin@21 \

boots https://corretto.aws/downloads/latest/amazon-corretto-17-aarch64-macos-jdk.pkg


alias java8="unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 1.8`; java -version"
alias java11="unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"
alias java16="unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 16`; java -version"
alias java17="unset JAVA_HOME; export JAVA_HOME=`/usr/libexec/java_home -v 17`; java -version"

# https://github.com/Homebrew/homebrew-cask-versions/tree/master/Casks
brew tap homebrew/cask-versions

# https://docs.brew.sh/Taps#formula-with-duplicate-names
brew $ACTION_VERB \
    --cask \
        java \




brew $ACTION_VERB \
    --cask \
        homebrew/cask-versions/zulu8 \
        adoptopenjdk/openjdk/adoptopenjdk8 \
        homebrew/cask-versions/corretto8 \

brew $ACTION_VERB \
    --cask \
        oracle-jdk \
        oracle-jdk17 \
        oracle-jdk-javadoc \

brew $ACTION_VERB \
    --cask \
        jad \

/usr/libexec/java_home -V

/usr/libexec/java_home -v 1.8

export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU

echo \
"
# JAVA_HOME after installation (homebrew)
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> $HOME/.zshrc

echo \
"
# JAVA_HOME after installation (homebrew)
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> $HOME/.bashrc

echo \
"
# JAVA_HOME after installation (homebrew)
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> $HOME/.bash_profile

echo \
"
# JAVA_HOME after installation (homebrew)
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> $HOME/.zsh_profile

echo \
"
# JAVA_HOME after installation (homebrew)
export JAVA_HOME_ZULU=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/Home
export JAVA_HOME_CORRETO=/Library/Java/JavaVirtualMachines/amazon-corretto-8.jdk/Contents/Home
export JAVA_HOME_ADOPTOPENJDK=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export JAVA_HOME=$JAVA_HOME_ZULU
" >> $HOME/.profile

java -version
javac -version

# https://github.com/AdoptOpenJDK/homebrew-openjdk/issues/106
brew untap adoptopenjdk/openjdk
brew untap caskroom/versions

ls -al /Library/Java/JavaVirtualMachines/
# total 0
# drwxr-xr-x  3 root  wheel   96 Apr  7 16:16 adoptopenjdk-8.jdk
# rwxr-xr-x  3 root  wheel   96 Feb 21 19:14 amazon-corretto-8.jdk
# rwxr-xr-x  3 root  wheel   96 Apr  7 16:26 jdk-14.jdk
# rwxr-xr-x  3 root  wheel   96 Apr  7 16:11 zulu-8.jdk
