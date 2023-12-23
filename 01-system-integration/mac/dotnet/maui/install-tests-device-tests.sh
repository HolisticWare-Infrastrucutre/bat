#!/bin/bash

brew \
  uninstall \
    node \
    carthage

  brew \
    install \
      opencv@4 \
      bundletool \
      gstreamer \
      gst-plugins-base \
      gst-plugins-good \
      gst-plugins-bad \
      gst-plugins-ugly \
      gst-libav \

brew \
  install \
    node \
    carthage
      
  brew \
    install \
      opencv@4 \
      bundletool \
      gstreamer \
      gst-plugins-base \
      gst-plugins-good \
      gst-plugins-bad \
      gst-plugins-ugly \
      gst-libav \

sudo \
  npm \
    uninstall \
      -g \
        appium-doctor \
        mjpeg-consumer \
        bundletool \
        opencv4nodejs \

sudo \
  npm \
    install \
      -g \
        appium-doctor \
        mjpeg-consumer \
        bundletool \
        opencv4nodejs \

echo "JAVA_HOME         = $JAVA_HOME"
echo "ANDROID_HOME      = $ANDROID_HOME"
echo "ANDROID_SDK_ROOT  = $ANDROID_SDK_ROOT"

sudo \
  dotnet \
    pwsh \
      eng/scripts/appium-install.ps1   

appium-doctor \
  --android

appium \
  -v

ll $HOME/.npm
ll $HOME/.appium


sudo chown -R "$(id -u):$(id -g)" "$HOME/.npm"
sudo chown -R "$(id -u):$(id -g)" "$HOME/.appium"

mkdir $ANDROID_HOME/bundle-tool/
curl \
  -k -L -s \
  https://github.com/google/bundletool/releases/download/1.15.6/bundletool-all-1.15.6.jar \
  -o $ANDROID_HOME/bundle-tool/bundletool.jar

chmod +x $ANDROID_HOME/bundle-tool/bundletool.jar
ll $ANDROID_HOME/bundle-tool/bundletool.jar
alias bundletool='java -jar $ANDROID_HOME/bundle-tool/bundletool.jar'
bundletool --version

DevToolsSecurity -enable

appium-doctor --ios








npm i -g mjpeg-consumer
WARN AppiumDoctor  ➜ bundletool.jar is used to handle Android App Bundle. Please read http://appium.io/docs/en/writing-running-appium/android/android-appbundle/ to install it
WARN AppiumDoctor  ➜ gst-launch-1.0 and gst-inspect-1.0 are used to stream the screen of the device under test. Please read https://appium.io/docs/en/writing-running-appium/android/android-screen-streaming/ to install them and for more details
  echo "--------------------------------------------------------------------------------------------------------------"
  echo \
  "
  appium-doctor --ios
  "
  appium-doctor --ios





















