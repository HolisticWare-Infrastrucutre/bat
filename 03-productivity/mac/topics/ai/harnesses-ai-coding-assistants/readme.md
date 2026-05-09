
*   claude code

    ```
    $HOME/bat/03-productivity/mac/topics/ai/harnesses/claude-code/run.sh
    ```
    
*   opencode


```bash
# pi -- top harness on this benchmark (76.9% on Q4 sweep)
# Non-interactive: -p reads the prompt and exits; -nc/-ns/-ne/-np disable AGENTS.md /
# skills / extensions / prompt-template discovery (fairness in the sweep)
pi --provider local-llama --model bench-model -p --no-session -nc -ns -ne -np "<prompt>"
# Interactive: drop the -p flag (and keep the discovery flags off if you want a clean run)
pi --provider local-llama --model bench-model

# qwen -- fastest near-top harness (75.0%)
# Non-interactive: pass the prompt as a positional argument; --approval-mode yolo
# auto-approves all tool calls (you really do want this for an unattended run)
qwen --openai-base-url "http://127.0.0.1:8001/v1" --openai-api-key "dummy" --model "bench-model" --approval-mode yolo "<prompt>"
# Interactive: omit the prompt argument
qwen --openai-base-url "http://127.0.0.1:8001/v1" --openai-api-key "dummy" --model "bench-model"

# claude -- via the Anthropic-compat shim against llama-server
# Non-interactive: -p reads stdin / a positional prompt; --bare disables MCP autoload;
# --dangerously-skip-permissions is the equivalent of qwen's `yolo`
ANTHROPIC_BASE_URL="http://127.0.0.1:8001" ANTHROPIC_API_KEY="sk-ant-local-dummy" \
  claude --bare --model bench-model -p --dangerously-skip-permissions "<prompt>"
# Interactive: drop -p (the TUI manages the prompt itself)
ANTHROPIC_BASE_URL="http://127.0.0.1:8001" ANTHROPIC_API_KEY="sk-ant-local-dummy" \
  claude --bare --model bench-model --dangerously-skip-permissions

# opencode -- run command is one-shot; opencode without it is the TUI
# Non-interactive: `opencode run` with the prompt
opencode run -m "llamacpp/bench-model" "<prompt>"
# Interactive: just `opencode` in the workspace
opencode

# aider -- git-native; --message is one-shot, no flags = REPL
# Non-interactive: --message + --yes-always; --no-stream is friendlier to local servers
OPENAI_API_BASE="http://127.0.0.1:8001/v1" OPENAI_API_KEY="dummy" \
  aider --model "openai/bench-model" --no-git --yes-always --no-stream --message "<prompt>"
# Interactive: drop --message and you get the standard aider REPL
OPENAI_API_BASE="http://127.0.0.1:8001/v1" OPENAI_API_KEY="dummy" \
  aider --model "openai/bench-model" --no-git
```