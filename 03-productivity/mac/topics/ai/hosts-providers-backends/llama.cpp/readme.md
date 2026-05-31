

*   https://docs.servicestack.net/ai-server/llama-server#access-llama-server-from-c

*   https://dev.to/avatsaev/pro-developers-guide-to-local-llms-with-llamacpp-qwen-coder-qwencode-on-linux-15h

*   https://www.reddit.com/r/LocalLLaMA/comments/1jxbba9/you_can_now_use_github_copilot_with_native/

```shell
# Qwen3.6-27B (UD-Q4_K_XL) -- top combo with `pi`: 16/16 at ~207 s/task
llama-server \
    -hf unsloth/Qwen3.6-27B-GGUF:UD-Q4_K_XL \
    --alias bench-model \
    --flash-attn on \
    --cache-type-k q8_0 \
    --cache-type-v q8_0 \
    --jinja -np 1 \
    --host 127.0.0.1 \
    --port 11454 \
    --ctx-size 131072 \
```

```shell
# gpt-oss-120b (MXFP4, 32k ctx) -- fastest 15/16 combo with `pi` (~34 s/task)
llama-server \
    -hf ggml-org/gpt-oss-120b-GGUF \
    --alias bench-model \
    --flash-attn on \
    --cache-type-k q8_0 \
    --cache-type-v q8_0 \
    --jinja -np 1 \
    --host 127.0.0.1 \
    --port 8001 \
    --ctx-size 32768 \
```


## Original


```shell
# Qwen3.6-27B (UD-Q4_K_XL) -- top combo with `pi`: 16/16 at ~207 s/task
llama-server -hf unsloth/Qwen3.6-27B-GGUF:UD-Q4_K_XL --alias bench-model --port 8001 --host 127.0.0.1 --ctx-size 131072 --flash-attn on --cache-type-k q8_0 --cache-type-v q8_0 --jinja -np 1

# gpt-oss-120b (MXFP4, 32k ctx) -- fastest 15/16 combo with `pi` (~34 s/task)
llama-server -hf ggml-org/gpt-oss-120b-GGUF --alias bench-model --port 8001 --host 127.0.0.1 --ctx-size 32768 --flash-attn on --cache-type-k q8_0 --cache-type-v q8_0 --jinja -np 1

# Qwen3.6-35B-A3B (MoE, 3B active, UD-Q4_K_XL) -- 15/16 with `qwen` at ~108 s/task
llama-server -hf unsloth/Qwen3.6-35B-A3B-GGUF:UD-Q4_K_XL --alias bench-model --port 8001 --host 127.0.0.1 --ctx-size 131072 --flash-attn on --cache-type-k q8_0 --cache-type-v q8_0 --jinja --chat-template-kwargs '{"enable_thinking":false}' -np 1

# gemma-4-26B-A4B-it (UD-Q4_K_XL) -- smallest 15/16 cell, with `opencode` (~307 s/task)
llama-server -hf unsloth/gemma-4-26B-A4B-it-GGUF:UD-Q4_K_XL --alias bench-model --port 8001 --host 127.0.0.1 --ctx-size 131072 --flash-attn on --cache-type-k q8_0 --cache-type-v q8_0 --jinja -np 1

# gemma-4-31b-it (Q4_K_M, 65k ctx) -- 15/16 with `pi` at ~422 s/task
llama-server -hf unsloth/gemma-4-31b-it-GGUF:Q4_K_M --alias bench-model --port 8001 --host 127.0.0.1 --ctx-size 65536 --flash-attn on --cache-type-k q8_0 --cache-type-v q8_0 --jinja -np 1
```