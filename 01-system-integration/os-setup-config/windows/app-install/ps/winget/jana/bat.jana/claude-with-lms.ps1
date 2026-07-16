$env:ANTHROPIC_AUTH_TOKEN = "lms--lm-studio"
$env:ANTHROPIC_API_KEY = ""
$env:ANTHROPIC_BASE_URL = "http://localhost:11444"
$env:ANTHROPIC_MODEL = "qwen/qwen3.6-35b-a3b"
claude --model $env:ANTHROPIC_MODEL
