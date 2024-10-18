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

rm -fr $HOME/Library/Caches/com.hnc.Discord
rm -fr $HOME/Library/Caches/com.hnc.Discord.ShipIt
rm -fr $HOME/Library/Caches/com.apple.nsurlsessiond/Downloads/com.hnc.Discord
rm -fr $HOME/Library/Saved\ Application State/com.hnc.Discord.savedState
rm -fr $HOME/Library/HTTPStorages/com.hnc.Discord
rm -fr $HOME/Library/HTTPStorages/com.hnc.Discord.binarycookies

brew doctor

# ./Library/Caches/Homebrew/downloads/e8a96cddbbfc88aa157e699ba00df7aa4d9e0f2bf51815701c9052a55fcdded5--Discord.dmg
# ./Library/Caches/Homebrew/downloads/5471a9c1b429d4ac9ce8302b9b041c14f05c80fc0da7de4a0cf7334a027f10c8--Discord.dmg
# ./Library/Caches/Homebrew/Cask/discord--0.0.321.dmg
# ./Library/Caches/Homebrew/Cask/discord--0.0.322.dmg
# ./Library/Caches/com.hnc.Discord
# ./Library/Caches/com.hnc.Discord.ShipIt
# ./Library/Caches/com.apple.nsurlsessiond/Downloads/com.hnc.Discord
# ./Library/Saved Application State/com.hnc.Discord.savedState
# ./Library/HTTPStorages/com.hnc.Discord
# ./Library/HTTPStorages/com.hnc.Discord.binarycookies
# ./Library/Preferences/ByHost/com.hnc.Discord.ShipIt.4C170429-24A6-553F-B348-0B23B4D43DE4.plist
# ./Library/Preferences/com.hnc.Discord.plist
# ./Library/Application Support/discord
# ./Library/Application Support/discord/0.0.322/modules/discord_utils
# ./Library/Application Support/discord/0.0.322/modules/discord_utils/discord_utils.node
# ./Library/Application Support/discord/0.0.322/modules/discord_erlpack
# ./Library/Application Support/discord/0.0.322/modules/discord_erlpack/discord_erlpack.node
# ./Library/Application Support/discord/0.0.322/modules/discord_desktop_core
# ./Library/Application Support/discord/0.0.322/modules/discord_zstd
# ./Library/Application Support/discord/0.0.322/modules/discord_zstd/discord_zstd.node
# ./Library/Application Support/discord/0.0.322/modules/discord_game_utils
# ./Library/Application Support/discord/0.0.322/modules/discord_game_utils/discord_game_utils.node
# ./Library/Application Support/discord/0.0.322/modules/discord_modules
# ./Library/Application Support/discord/0.0.322/modules/discord_modules/ec35bb8e1f5d7c/2/discord_game_sdk.dylib
# ./Library/Application Support/discord/0.0.322/modules/discord_modules/discord_modules.node
# ./Library/Application Support/discord/0.0.322/modules/discord_cloudsync
# ./Library/Application Support/discord/0.0.322/modules/discord_cloudsync/discord_cloudsync.node
# ./Library/Application Support/discord/0.0.322/modules/discord_voice
# ./Library/Application Support/discord/0.0.322/modules/discord_voice/discord_voice.node
# ./Library/Application Support/discord/0.0.322/modules/discord_voice/discord-last-webrtc_0
# ./Library/Application Support/discord/0.0.322/modules/discord_voice/discord-webrtc_0
# ./Library/Application Support/discord/0.0.322/modules/discord_dispatch
# ./Library/Application Support/discord/0.0.322/modules/discord_dispatch/discord_dispatch.node
# ./Library/Application Support/discord/0.0.322/modules/discord_spellcheck
# ./Library/Application Support/discord/0.0.322/modules/discord_krisp
# ./Library/Application Support/discord/0.0.322/modules/discord_krisp/discord_krisp.node
# ./Library/Application Support/discord/0.0.322/modules/discord_rpc
# ./Library/Application Support/discord/logs/discord_zstd_rCURRENT.log
# ./Library/Application Support/discord/logs/discord_krisp.log
# ./Library/Application Support/discord/logs/discord_utils.log
# ./Library/Application Support/discord/modules/2/discord_game_sdk
# ./Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.hnc.discord.sfl3
