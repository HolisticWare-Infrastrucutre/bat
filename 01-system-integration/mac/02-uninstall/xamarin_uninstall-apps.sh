#!/bin/bash
# This is a simple script to uninstall Xamarin from your machine.
 
. ./xamarin_uninstall-apps-xamarin-studio.sh
. ./xamarin_uninstall-apps-mono-MDK.sh
. ./xamarin_uninstall-apps-xamarin-android.sh
. ./xamarin_uninstall-apps-xamarin-ios.sh
. ./xamarin_uninstall-apps-xamarin-mac.sh
. ./xamarin_uninstall-apps-xamarin-build-host.sh
. ./xamarin_uninstall-apps-xamarin-installer.sh


sudo rm -rf ~/Library/Caches/XamarinInstaller/
sudo rm -rf ~/Library/Caches/VisualStudioInstaller/
sudo rm -rf ~/Library/Logs/XamarinInstaller/
sudo rm -rf ~/Library/Logs/VisualStudioInstaller/
sudo rm -rf ~/Library/Preferences/Xamarin/
sudo rm -rf "~/Library/Preferences/Visual Studio/"
sudo rm -rf "/Applications/Xamarin Profiler.app"

