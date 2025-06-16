#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew  doctor
brew  cleanup

#---------------------------------------------------------------------------------------------------

brew $ACTION_VERB \
    --cask \
        lm-studio \
        backyard-ai \
        msty \
        jan \


# The intelligent terminal.
brew $ACTION_VERB \
    --cask \
        claude \
        warp \
        amazon-q \

brew $ACTION_VERB \
        aider \
        ollama \

brew $ACTION_VERB \
    --cask \
        ollamac \
        ollama \


# claude code
npm $ACTION_VERB -g @anthropic-ai/claude-code



npm $ACTION_VERB \
    -g \
        @anthropic-ai/claude-code        


