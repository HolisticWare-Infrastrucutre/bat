

```shell
find \
    ~/.lmstudio/models/ \
    ~/.ollama/models/ \
    ~/.cache/huggingface/ \
    ~/.huggingface/ \
    ~/.omlx/models/ \
        -type f \
        -iname "*.gguf"

```