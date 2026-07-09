#!/bin/bash


echo \
"
export ANTHROPIC_AUTH_TOKEN=llama.cpp
export ANTHROPIC_API_KEY=""
export ANTHROPIC_BASE_URL=http://localhost:11454
export ANTHROPIC_MODEL=Qwen3.6-35B-A3
claude --model $ANTHROPIC_MODEL

export ANTHROPIC_AUTH_TOKEN=lms-lm-studio
export ANTHROPIC_API_KEY=""
export ANTHROPIC_BASE_URL=http://localhost:11444
export ANTHROPIC_MODEL=qwen3.6-40b-claude-4.6-opus-deckard-heretic-uncensored-thinking:2
claude --model $ANTHROPIC_MODEL




export COPILOT_PROVIDER_BASE_URL=http://localhost:11454
export COPILOT_MODEL=Qwen3.6-35B-A3

# For a remote OpenAI endpoint, also set your API key.

export COPILOT_OFFLINE=true
export COPILOT_PROVIDER_API_KEY=
export COPILOT_PROVIDER_BASE_URL=http://localhost:11454
export COPILOT_MODEL=Qwen3.6-35B-A3
copilot




# Get your key from https://aistudio.google.com/apikey
export GEMINI_API_KEY="local-dev-key"
export GOOGLE_GEMINI_BASE_URL=http://localhost:11454
gemini -m Qwen3.6-35B-A3





# anthropic claude
export ANTHROPIC_AUTH_TOKEN=ollama \\
&& \\
export ANTHROPIC_API_KEY="" \\
&& \\
export ANTHROPIC_BASE_URL=http://localhost:11434 \\
&& \\
claude --model $ANTHROPIC_MODEL

# github copilot

# openai codex
# https://developers.openai.com/codex/app/local-environments
codex --config model_providers.local_ollama.name = "ollama"
codex --config model_providers.local_ollama.base_url = "http://localhost:11434/v1"
codex --config model='"gpt-5.4"'



# smallcode
SMALLCODE_MODEL=Qwen3.6-35B-A3
SMALLCODE_BASE_URL=http://localhost:11454/v1


# opencode

# backends

ollama                                  http://localhost:11434/v1/models     
llama.cpp                               http://localhost:11454/v1/models
lms                                     http://localhost:11464/v1/models              
"