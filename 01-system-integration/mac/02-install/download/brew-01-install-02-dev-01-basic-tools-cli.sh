#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

#----------------------------------------------------------------------------------------------
#
# find
# https://github.com/sharkdp/fd
brew $ACTION_VERB \
    fd

# grep
# https://www.warp.dev/
brew $ACTION_VERB \
    ripgrep \

# https://github.com/cli/cli#installation
# https://cli.github.com/
brew $ACTION_VERB \
    gh \
    glab \

