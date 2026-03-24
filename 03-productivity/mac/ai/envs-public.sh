#!/bin/bash

export OLLAMA_SERVER_PORT=11434
export LMS_SERVER_PORT=11444
export IK_LLAMA_CPP_SERVER_PORT=11454
export LLAMA_CPP_SERVER_PORT=11464

export ANTHROPIC_AUTH_TOKEN_OLLAMA=ollama
export ANTHROPIC_BASE_URL_OLLAMA=http://localhost:11434

export ANTHROPIC_AUTH_TOKEN_LLAMA_CPP=ik_llama.cpp
export ANTHROPIC_BASE_URL_LLAMA_CPP=http://localhost:11464

export ANTHROPIC_AUTH_TOKEN_LLAMA_CPP=llama.cpp
export ANTHROPIC_BASE_URL_LLAMA_CPP=http://localhost:11464


# http://127.0.0.1:11434/
# http://127.0.0.1:11434/v1/models

# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER] Success! HTTP server listening on port 11444
# 2026-03-22 12:45:03  [INFO]
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER] Supported endpoints:
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]   LM Studio API
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]    ->  GET  http://localhost:11444/api/v1/models
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]    ->  POST http://localhost:11444/api/v1/chat
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]    ->  POST http://localhost:11444/api/v1/models/load
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]    ->  POST http://localhost:11444/api/v1/models/download
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]    ->  GET http://localhost:11444/api/v1/models/download/status:job_id
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]   OpenAI-compatible
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]    ->  GET  http://localhost:11444/v1/models
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]    ->  POST http://localhost:11444/v1/responses
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]    ->  POST http://localhost:11444/v1/chat/completions
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]    ->  POST http://localhost:11444/v1/completions
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER]    ->  POST http://localhost:11444/v1/embeddings
# 2026-03-22 12:45:03  [INFO]
#  [LM STUDIO SERVER] Logs are saved into /Users/moljac/.lmstudio/server-logs
# 2026-03-22 12:45:03  [INFO]
#  Server started.
# 2026-03-22 12:45:03  [INFO]
#  Just-in-time model loading active.
# 2026-03-22 12:46:26  [INFO]
#  [Plugin(lmstudio/rag-v1)] stdout: [PromptPreprocessor] Register with LM Studio
# 2026-03-22 12:48:54 [ERROR]
#  Unexpected endpoint or method. (GET /). Returning 200 anyway
# 2026-03-22 12:48:54 [ERROR]
#  Unexpected endpoint or method. (GET /favicon.ico). Returning 200 anyway

# http://127.0.0.1:11444