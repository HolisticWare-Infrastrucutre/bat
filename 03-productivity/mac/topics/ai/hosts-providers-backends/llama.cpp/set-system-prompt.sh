
export LLAMA_CPP_PROMPT_FILE="/Users/Shared/Projects/d/hw/core/gh/HolisticWare.Core.BusinessDomainModels.TemplateRepo/docs/ai/prompts/system/p01.md"

export LLAMA_CPP_SERVER_PORT=11454

curl -s \
    --request POST \
    --url http://127.0.0.1:$LLAMA_CPP_SERVER_PORT/v1/chat/completions \
    --header "Content-Type: application/json" \
    --data '{"messages": [ { "role": "system", "content": "End each sentence with a smiley emoji." }, { "role": "user", "content": "Hello, how are you today?" }, { "role": "assistant", "content": "I am functioning properly and ready to assist you, thanks for asking! 😊" }, { "role": "system", "content": "End each sentence with a party emoji." }, { "role": "user", "content": "Nice to meet you, my name is Georgi." } ], "cache_prompt": true, "top_k": 1}' | jq

