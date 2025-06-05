#!/bin/bash

export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
cd $HOME/Downloads/



# https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd
brew tap azure/azd \
&& \
brew $ACTION_VERB \
    azd

# brew upgrade \
#     azd
# brew uninstall \
#     azd

brew update 

# Add the tap for bicep
brew tap \
    azure/bicep

# Install the tool
brew $ACTION_VERB \
    bicep


brew $ACTION_VERB \
    azure-cli

# https://cloud.google.com/sdk/
brew $ACTION_VERB \
    --cask \
    google-cloud-sdk

# 
brew $ACTION_VERB \
    awscli

cd -