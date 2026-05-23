

```shell
# Required
export SMALLCODE_MODEL=your-model-name
export SMALLCODE_BASE_URL=http://localhost:1234/v1
```


```.env
# Required
SMALLCODE_MODEL=your-model-name
SMALLCODE_BASE_URL=http://localhost:1234/v1

# Optional: escalation (auto-fallback to cloud on hard fail)
# ANTHROPIC_API_KEY=sk-ant-...
# OPENAI_API_KEY=sk-...
# DEEPSEEK_API_KEY=sk-...
```