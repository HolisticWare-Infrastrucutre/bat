#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew upgrade
brew update

brew \
    $ACTION_VERB \
        --formula \
            git \
            gh \
            github-mcp-server \
            github-markdown-toc \
            gitlab-ci-local \
            gitlab-runner \
            glab \
            wget \



brew \
    $ACTION_VERB \
        --cask \
            github \
            github@beta \
            git-credential-manager \


#----------------------------------------------------------------------------------------------
#
# find
# https://github.com/sharkdp/fd
brew \
    $ACTION_VERB \
        --formula \
            fd

# grep
# https://www.warp.dev/
brew \
    $ACTION_VERB \
        --formula \
            ripgrep \

# https://github.com/cli/cli#installation
# https://cli.github.com/
brew \
    $ACTION_VERB \
        --formula \
            gh \
            glab \

