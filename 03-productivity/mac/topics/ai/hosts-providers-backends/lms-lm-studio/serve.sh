#!/bin/bash

source "${BASH_SOURCE%/*}/../ports.sh"

export LMS_LM_STUDIO_MODEL=qwen3.6-40b-claude-4.6-opus-deckard-heretic-uncensored-thinking

lms \
    server \
        start \
            --port $LMS_SERVER_PORT

lms \
    load \
        $LMS_LM_STUDIO_MODEL
