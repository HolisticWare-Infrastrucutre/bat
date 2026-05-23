

echo \
"
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


# opencode

# smallcode
SMALLCODE_MODEL=your-model-name
SMALLCODE_BASE_URL=http://localhost:1234/v1

"