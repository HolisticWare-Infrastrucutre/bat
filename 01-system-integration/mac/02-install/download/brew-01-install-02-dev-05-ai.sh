#!/bin/bash

# Action/Verb
# install / uninstall / reinstall
export ACTION_VERB=install

brew doctor
brew cleanup
brew upgrade
brew update

#---------------------------------------------------------------------------------------------------

brew \
    $ACTION_VERB \
        --formula \
            ollama \
            llamc.cpp \
            llm \


brew \
    $ACTION_VERB \
        --formula \
            aider \
            codex \
            gemini-cli \
            block-goose-cli \
            codex \
            charmbracelet/tap/crush \
            

brew \
    $ACTION_VERB \
        --cask \
            cursor-cli \

brew \
    $ACTION_VERB \
        --formula \
            gptscript \
            promptfoo \
            aichat \
            aicommit \
            aicommits \
            claude-squad \
            cortexso \
            gptme \
            localai \
            ramalama \
            tgpt \
            tmuxai \
            vespa-cli \
            whisper-cpp \

brew \
    $ACTION_VERB \
        --formula \
            ultraviolet/uv/uv \

# providers/runners
brew \
    $ACTION_VERB \
        --formula \
            mcphost \
            gorilla-cli \


# prompting
brew \
    $ACTION_VERB \
        --formula \
            block-goose \
            warp \
            pdl \
            code2prompt \
            promptfoo \
            gptscript \
            tenere \

#        rawdog


# To use gpt4all in the terminal with ‘llm’
llm install llm-gpt4all
llm models list

brew \
    $ACTION_VERB \
        --cask \
            gpt4all \
            anythingllm \
            chatwise \
            cherry-studio \
            macai \
            msty \
            sanctum \
            

# To increase the amount of RAM available to the llama-server process, use the following command:
# on a 192GB machine, raise the limit from 154GB (default) to 180GB
sudo sysctl iogpu.wired_limit_mb=180000

# Devices with more than 96GB RAM
# The M2 Max, M3 Max, M4 Max, M1 Ultra, M2 Ultra, M3 Ultra, etc. chips can run both models at full context:


brew \
    $ACTION_VERB \
        --cask \
            ollamac \
            ollama \
            lm-studio \
            backyard-ai \
            msty \
            jan \
            anythingllm \
            sanctum \
            gpt4all \
            chatbox \
            chatgpt \


# The intelligent terminal.
brew \
    $ACTION_VERB \
        --cask \
            claude \
            claude-code \
            cursor \
            deepchat \
            warp \
            amazon-q \
            itermai \
            langflow \
            pdf-pals \
            rivet \
            vibemeter \
        



# claude code
npm \
    $ACTION_VERB \
        -g \
            @anthropic-ai/claude-code \
            @musistudio/claude-code-router \
            @google/gemini-cli \
            @qwen-code/qwen-code \

# OCR / PDF
brew \
    $ACTION_VERB \
        --cask \
        --force \
            libmagic \
            poppler \
            tesseract


# in editors
# windsurf (ex Codeium)
# brew $ACTION_VERB --cask \
#     --cask \
#         windsurf



# anythingllm	            1.8.0	                Private desktop AI chat application	AnythingLLM
# backyard-ai	            0.36.0	                Run AI models locally	Backyard AI
# chatbox	                1.12.0	                Desktop app for GPT-4 / GPT-3.5 (OpenAI API)
# claude	                0.9.2	                Anthropic's official Claude AI desktop app
# deepchat	                0.0.16	                AI assistant
# elephas	                11.1086	                Personal AI Writing Assistant
# elephas@beta	            11.1086	                Personal AI Writing Assistant
# fixkey	                2.9.1	                Keyboard-focused AI copilot for writing	fixkey
# highlight	                1.1.40	                Context-aware AI assistant
# itermai	                1.1	                    Enable generative AI features in iTerm2
# jan	                    0.5.16	                Offline AI chat tool
# opencat	                2.52.1                  Native AI chat client
# pdf-pals	                1.8.1                   AI Chat with PDFs
# poe	                    1.1.31                  AI chat client
# rivet	                    1.10.1	                Open-source visual AI programming environment
# rize	                    1.5.5	                AI time tracker
# trae	                    1.0.12119	            Adaptive AI IDE
# windsurf	                1.7.0,69a90000132...	Agentic IDE powered by AI Flow paradigm
# windsurf@next	            1.7.101+next.2c96...	Agentic IDE powered by AI Flow paradigm
# 
# 
# cortexso	                0.1.1	                Drop-in, local AI alternative to the OpenAI stack
# fairymax	                5.0b	                AI for playing Chess variants
# github-mcp-server	        0.1.1-release-val...	GitHub Model Context Protocol server for AI tools
# gptme	                    0.27.0	                AI assistant in your terminal
# aider	                    0.82.2	                AI pair programming in your terminal
# localai	                2.28.0	                OpenAI alternative
# mods	                    1.7.0	                AI on the command-line
# openvino	                2025.0.0	            Open Visual Inference And Optimization toolkit for AI inference
# ramalama	                0.7.5	                Goal of RamaLama is to make working with AI boring
# tgpt	                    2.9.6	                AI Chatbots in terminal without needing API keys

brew  doctor
brew  cleanup
