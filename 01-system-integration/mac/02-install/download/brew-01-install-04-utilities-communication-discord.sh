#!/bin/bash

# Action/Verb
# install / uninstall / reinstall


brew upgrade
brew update

brew uninstall \
    --cask \
        discord

rm -fr "$HOME/Library/Caches/com.hnc.Discord/"
rm -fr "$HOME/Library/Caches/com.hnc.Discord.ShipIt/"
rm -fr "$HOME/Library/Saved Application State/com.hnc.Discord.savedState/"

#    -fr "$HOME/Library/Logs/Discord/" \
#    -fr "$HOME/Library/Preferences/com.hnc.Discord.plist" \
#    -fr "$HOME/Library/Preferences/com.hnc.Discord.ShipIt.plist" \
rm -fr "$HOME/Library/Application Support/Discord/"
rm -fr "/Library/Application Support/Discord"   

brew install \
    --cask \
        discord


brew doctor