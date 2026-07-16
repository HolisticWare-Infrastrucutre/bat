$env:ANTHROPIC_AUTH_TOKEN = "llama.cpp"
$env:ANTHROPIC_API_KEY = ""
$env:ANTHROPIC_BASE_URL = "http://localhost:11444"
$env:ANTHROPIC_MODEL = "Qwen3.6-35B-A3"
claude --model $env:ANTHROPIC_MODEL
