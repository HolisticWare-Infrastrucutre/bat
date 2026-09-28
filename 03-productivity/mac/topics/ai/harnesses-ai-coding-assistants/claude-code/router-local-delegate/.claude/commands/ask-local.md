---
description: >
    Ask the local inference provider/runtime/backend and loaded model a question. 
    
    Flags:
        --model MODEL
        --think
        --max-tokens N
        --system SYS. 
        
        Default MODEL is qwen3.6-40b-claude-4.6-opus-deckard-heretic-uncensored-thinking

argument-hint: [--model MODEL] [--think] [--max-tokens N] [--system SYS] <prompt>
allowed-tools: Bash(python3:*)
---                                                                                                                                          
The user wants to query the local model with: $ARGUMENTS

Parse the arguments to extract any flags (--model, --think, --max-tokens, --system) and the remaining text as the prompt.
Then call:

    ```
    python3 ~/.claude/scripts/query_lm.py [extracted flags] "prompt text"
    ```

Present the model's response to the user. Include which model was used. If the call fails with a connection error, tell
the user to check that LM Studio is running with the Local Server enabled on port 11444.
