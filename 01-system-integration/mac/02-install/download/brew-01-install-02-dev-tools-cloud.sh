#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install



brew uninstall --cask \
    --force \
        docker 
brew uninstall --formula \
    --force \
        docker 

# DO NOT install forlmula and cask
# cask is enough
# https://github.com/Homebrew/homebrew-cask/issues/146078
#     docker \

brew install --cask \
    docker

brew install \
    docker-buildx \
    docker-clean \
    docker-completion \
    docker-compose \
    docker-credential-helper \
    docker-credential-helper-ecr \

mkdir -p ~/.docker/cli-plugins
ln -sfn \
    /opt/homebrew/opt/docker-buildx/bin/docker-buildx \
    $HOME/.docker/cli-plugins/docker-buildx
mkdir -p $HOME/.docker/cli-plugins
ln -sfn \
    /opt/homebrew/opt/docker-compose/bin/docker-compose \
    $HOME/.docker/cli-plugins/docker-compose
