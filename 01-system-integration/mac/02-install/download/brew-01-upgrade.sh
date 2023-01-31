#!/bin/bash

brew list
brew outdated


# update/upgrade brew only
brew update

brew cleanup
brew autoremove

# Download and update ALL software packages installed
brew upgrade
brew upgrade --cask

# To see which files would be removed as no longer needed:
brew cleanup -n

# No response if there is nothing to clear.

# To really remove all files no longer needed:
brew cleanup
brew doctor

brew cleanup
brew autoremove
