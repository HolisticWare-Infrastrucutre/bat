#!/bin/bash

macosx-customize.sh

# MacOSX customizations

# Finder tabs with path or current folder name
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true; killall Finder
