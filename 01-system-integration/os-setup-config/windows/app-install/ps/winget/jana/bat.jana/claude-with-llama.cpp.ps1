$env:ANTHROPIC_AUTH_TOKEN = "llama.cpp"
$env:ANTHROPIC_API_KEY = ""
$env:ANTHROPIC_BASE_URL = "http://localhost:11454"
$env:ANTHROPIC_MODEL = "Qwen3.6-27B"
claude --model $env:ANTHROPIC_MODEL
