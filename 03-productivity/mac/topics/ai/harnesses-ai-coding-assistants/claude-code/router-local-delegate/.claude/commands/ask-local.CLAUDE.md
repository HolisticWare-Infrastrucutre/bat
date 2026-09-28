## Local LLM Agent


*   Local inference providers 

    *   used as a fast, lightweight subagent to offload simple subtasks

    *   available:

        1.  LM Studio server
    
            ```
            http://127.0.0.1:11444
            ```

        2.  LLama.cpp
    
            ```
            http://127.0.0.1:11454
            ```

        3.  ik_LLama.cpp
    
            ```
            http://127.0.0.1:11464
            ```

*   Steps: 

    1.  Before using it, always ask the user if provider is currently running
        
        it may not always be available (e.g. after a crash or restart)

    2.  offer delegation to local LLM

        *   When

            *   Generating boilerplate code or first-draft implementations

            *   Brainstorming approaches or listing options

            *   Simple text transformations 
            
                *   summarize
                
                *   reformat
                
                *   translate
            
            *   Quick lookups or explanations that don't need full context

            *   Repetitive subtasks within a longer workflow

        *   How to call it

            *   For tasks involving files use 
            
                ```shell
                agent_lm.py
                ```

                *   The model reads files itself via tool calls
                
                *   File content never enters Claude's context.

                ```bash
                python3 \
                    ~/.claude/scripts/agent_lm.py \
                        --dir /path/to/project \
                        --model SomeModel \
                        "task description"
                ```

                *   Options: 
                
                    *   `--model`
                    
                    *   `--think`
                    
                    *   `--max-tokens` (default 2000)
                    
                    *   `--max-turns` (default 10)

            *   prompt-only tasks — use 
            
                ```shell
                query_lm.py
                ```

                ```bash
                python3 \
                    ~/.claude/scripts/query_lm.py \
                        "your prompt here"
                ```

                piping:

                ```bash
                # Pipe content + prompt:
                cat file.txt \
                | \
                python3 \
                    ~/.claude/scripts/query_lm.py \
                    "summarize this"
                ```

                *   Options: 
                
                    *   `--model`
                    
                    *   `--think`
                    
                    *   `--max-tokens` (default 1000)
                    
                    *   `--system`
                    
                    *   `--list-models`

*   invocation

    *   direct as command 
    
        `/ask-local <prompt>`


### Notes

*   LM Studio

    *   Thinking is disabled via LM Studio's Jinja template
    
        *   responses are fast and token-efficient by default
        
        `--think` re-enables it if needed for hard problems

    *   Typical tasks complete in 50–300 completion tokens; default limits (1000/2000) are generous

    *   This computer has limited RAM — one query at a time, no concurrent calls

    *   Both scripts use only Python stdlib, no pip dependencies needed

    *   `agent_lm.py` caps file reads at ~12 000 chars to avoid 400 errors