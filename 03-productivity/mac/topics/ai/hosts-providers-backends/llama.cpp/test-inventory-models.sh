#!/bin/bash

# Batch-tests a list of model ids against a chat-completions-compatible
# server. Two ways to run:
#
#   1. Own llama.cpp router (default): starts the router (rebuilding the
#      symlink farm) + memory watchdog on port 11454, tests each model in
#      turn (router's --models-max 1 LRU-evicts between tests, no restart
#      needed), tears everything down after.
#
#   2. --external-port PORT: an already-running server the caller manages
#      (e.g. LM Studio on 11444). No process is started, watched, or killed
#      -- just loops the tests against that port.
#
# Usage: test-inventory-models.sh [--mode text|audio|vision] [--external-port PORT] [--endpoint-path PATH] RESULTS_JSONL_FILE MODEL_ID [MODEL_ID ...]
#
# --mode text (default): test-model-load.sh, /v1/chat/completions, plain text
# --mode audio: test-audio-model-load.sh, /v1/audio/transcriptions (ASR models)
# --mode vision: test-vision-model-load.sh, /v1/chat/completions + image_url (OCR/vision models)
# --endpoint-path PATH: override the chat-completions path (text/vision modes
#   only). Default /v1/chat/completions. Use /api/v0/chat/completions for LM
#   Studio to get its populated "stats" object (tok/s, time_to_first_token).
#
# Writes one JSON result line per model to RESULTS_JSONL_FILE. Merge those
# into models-inventory.json afterward with merge-test-results.py.

set -u
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

MODE="text"
EXTERNAL_PORT=""
ENDPOINT_PATH="/v1/chat/completions"
while [ "${1:-}" = "--mode" ] || [ "${1:-}" = "--external-port" ] || [ "${1:-}" = "--endpoint-path" ]; do
    if [ "$1" = "--mode" ]; then MODE="$2"; shift 2; fi
    if [ "$1" = "--external-port" ]; then EXTERNAL_PORT="$2"; shift 2; fi
    if [ "$1" = "--endpoint-path" ]; then ENDPOINT_PATH="$2"; shift 2; fi
done
case "$MODE" in
    text)   TESTER="$HERE/test-model-load.sh" ;;
    audio)  TESTER="$HERE/test-audio-model-load.sh" ;;
    vision) TESTER="$HERE/test-vision-model-load.sh" ;;
    *) echo "unknown --mode $MODE (expected text|audio|vision)" >&2; exit 2 ;;
esac

RESULTS_FILE="$1"; shift
MODEL_IDS=("$@")

if [ "${#MODEL_IDS[@]}" -eq 0 ]; then
    echo "usage: test-inventory-models.sh [--mode text|audio|vision] [--external-port PORT] [--endpoint-path PATH] RESULTS_JSONL_FILE MODEL_ID [MODEL_ID ...]" >&2
    exit 2
fi

> "$RESULTS_FILE"

if [ -n "$EXTERNAL_PORT" ]; then
    echo "using external server on port $EXTERNAL_PORT (not started/stopped by this script)"
    for model in "${MODEL_IDS[@]}"; do
        echo "testing: $model"
        if [ "$MODE" = "audio" ]; then
            RESULT=$(bash "$TESTER" "$model" "$EXTERNAL_PORT" 150)
        else
            RESULT=$(bash "$TESTER" "$model" "$EXTERNAL_PORT" 150 "$ENDPOINT_PATH")
        fi
        echo "$RESULT" >> "$RESULTS_FILE"
        echo "  -> $RESULT"
    done
    echo "done. results: $RESULTS_FILE"
    exit 0
fi

LOG_DIR="$(mktemp -d)"
ROUTER_LOG="$LOG_DIR/router.log"
WATCHDOG_LOG="$LOG_DIR/watchdog.log"

echo "logs: $LOG_DIR"

LLAMA_CPP_MODELS_DIR="$HOME/.cache/llama-router-models" \
LLAMA_CPP_MODELS_MAX=1 \
LLAMA_CPP_CTX_SIZE=4096 \
nohup bash "$HERE/serve-router.sh" > "$ROUTER_LOG" 2>&1 &
sleep 3
ROUTER_PID=$(pgrep -f "llama-server.*port 11454.*models-dir")
if [ -z "$ROUTER_PID" ]; then
    echo "router failed to start, see $ROUTER_LOG" >&2
    exit 1
fi
echo "router PID=$ROUTER_PID"

# Long watchdog window covering the whole batch: 6 checks/min * up to ~50min.
nohup "$HERE/mem-watchdog.sh" "$WATCHDOG_LOG" "$ROUTER_PID" 300 > "$LOG_DIR/watchdog.out" 2>&1 &
WATCHDOG_PID=$!
echo "watchdog PID=$WATCHDOG_PID"

for model in "${MODEL_IDS[@]}"; do
    echo "testing: $model"
    if ! kill -0 "$ROUTER_PID" 2>/dev/null; then
        echo "router died (likely watchdog killed it under critical memory pressure) -- aborting remaining tests" >&2
        echo "{\"model\":\"$model\",\"status\":\"skipped\",\"http_code\":null,\"elapsed_s\":null,\"tokens_per_second\":null,\"error\":\"router process died before this test ran\"}" >> "$RESULTS_FILE"
        continue
    fi
    RESULT=$(bash "$TESTER" "$model" 11454 150)
    echo "$RESULT" >> "$RESULTS_FILE"
    echo "  -> $RESULT"
done

kill "$WATCHDOG_PID" 2>/dev/null
lsof -ti :11454 | xargs -r kill 2>/dev/null
sleep 2
lsof -ti :11454 | xargs -r kill -9 2>/dev/null

echo "done. results: $RESULTS_FILE"
echo "watchdog log: $WATCHDOG_LOG"
cat "$WATCHDOG_LOG" 2>/dev/null
