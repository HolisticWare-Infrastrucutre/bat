$env:ANTHROPIC_AUTH_TOKEN = "lms--lm-studio"
$env:ANTHROPIC_API_KEY = ""
$env:ANTHROPIC_BASE_URL = "http://localhost:11444"
$env:ANTHROPIC_MODEL = "google/gemma-4-31b-qat"
claude --model $env:ANTHROPIC_MODEL
