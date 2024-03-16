#!/bin/bash

export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
cd $HOME/Downloads/


# https://github.com/sharkdp/fd
brew $ACTION_VERB \
    fd

# https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/install-azd
brew tap azure/azd \
&& \
brew $ACTION_VERB \
    azd

# brew upgrade \
#     azd
# brew uninstall \
#     azd

# https://cli.github.com/
# https://github.com/cli/cli#installation
brew $ACTION_VERB \
    gh

# https://github.com/cli/cli#installation

# Add the tap for bicep
brew tap \
    azure/bicep

# Install the tool
brew $ACTION_VERB \
    bicep


# https://cloud.google.com/sdk/
brew $ACTION_VERB \
    --cask \
    google-cloud-sdk

# 
brew $ACTION_VERB \
    awscli

cd -