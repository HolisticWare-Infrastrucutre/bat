#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew  doctor
brew  cleanup

#---------------------------------------------------------------------------------------------------

brew $ACTION_VERB \
        ollama \
        llamc.cpp \
        aider \
        gptscript \
        promptfoo \

brew $ACTION_VERB \
    --cask \
        ollamac \
        ollama \


brew $ACTION_VERB \
    --cask \
        lm-studio \
        backyard-ai \
        msty \
        jan \
        anythingllm \
        sanctum \
        gpt4all \


# The intelligent terminal.
brew $ACTION_VERB \
    --cask \
        claude \
        warp \
        amazon-q \


# claude code
npm $ACTION_VERB -g @anthropic-ai/claude-code



npm $ACTION_VERB \
    -g \
        @anthropic-ai/claude-code        


