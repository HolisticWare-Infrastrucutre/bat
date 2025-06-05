#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew  doctor
brew  cleanup

#---------------------------------------------------------------------------------------------------
# claude code
npm $ACTION_VERB -g @anthropic-ai/claude-code


# The intelligent terminal.
brew $ACTION_VERB \
    --cask \
        claude \
        warp \
        amazon-q \

npm $ACTION_VERB \
    -g \
        @anthropic-ai/claude-code        
