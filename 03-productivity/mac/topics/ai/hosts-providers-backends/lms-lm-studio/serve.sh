#!/bin/bash

# source "${BASH_SOURCE%/*}/../ports.sh"

export LMS_SERVER_PORT=11444

export LMS_LM_STUDIO_MODEL=qwen3.6-40b-claude-4.6-opus-deckard-heretic-uncensored-thinking
# export LMS_LM_STUDIO_MODEL=qwen3.6-35b-a3b

lms \
    server \
        start \
            --port $LMS_SERVER_PORT

lms \
    load \
        $LMS_LM_STUDIO_MODEL
