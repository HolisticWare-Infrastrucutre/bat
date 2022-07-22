#!/bin/bash

sudo rm -fr "/Applications/Visual Studio (Preview).app/"
sudo rm -fr "/Applications/Visual Studio.app/"

rm -fr "$HOME/Library/VisualStudio/"
rm -fr "$HOME/Library/Application Support/Microsoft Visual Studio/"
rm -fr "$HOME/Library/Application Support/VisualStudio/"
rm -rf "$HOME/Library/Application Support/VisualStudio/*/LocalInstall/Addins/"

rm -fr "$HOME/Library/Caches/Microsoft/"
rm -fr "$HOME/Library/Caches/VisualStudio/"
rm -fr "$HOME/Library/Caches/VisualStudioInstaller/"
rm -fr "$HOME/Library/Caches/XamarinBuildDownload/"
rm -fr "$HOME/Library/Caches/com.xamarin.visualstudioformacinstaller/"

sudo rm -fr "$HOME/Library/Caches/com.xamarin.fontconfig/"


rm -fr "$HOME/Library/Preferences/VisualStudio/"
rm -rf "$HOME/Library/Preferences/Visual Studio/"

rm -fr "$HOME/Library/Logs/Microsoft/"
rm -fr "$HOME/Library/Logs/VisualStudio/"
rm -fr "$HOME/Library/Logs/VisualStudioInstaller/"

rm -fr "$HOME/Library/Saved Application State/com.microsoft.visual-studio-preview.savedState"

