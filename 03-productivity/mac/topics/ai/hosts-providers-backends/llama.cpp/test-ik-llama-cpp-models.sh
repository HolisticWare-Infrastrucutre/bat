#!/bin/bash

# Batch-tests a list of inventory model ids through ik_llama.cpp's
# llama-server. Unlike upstream llama.cpp, this fork has no router mode
# (--models-dir), so each model needs its own full launch/test/kill cycle:
# look up its real file path from models-inventory.json, launch with
# --model (+ --mmproj if the entry has one), poll until ready, run the
# small test, kill it, move to the next model. A memory watchdog runs per
# launch, matching the pattern used for the llama.cpp router tests.
#
# Usage: test-ik-llama-cpp-models.sh [--mode text|audio|vision] RESULTS_JSONL_FILE MODEL_ID [MODEL_ID ...]

set -u
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INVENTORY="$HERE/models-inventory.json"
IK_BIN="$HOME/Downloads/HolisticWare/ai/ik_llama.cpp/macosx/ik_llama.cpp-main/ik_llama.cpp-main/build-macosx/bin/llama-server"
PORT=11464

MODE="text"
if [ "$1" = "--mode" ]; then MODE="$2"; shift 2; fi
case "$MODE" in
    text)   TESTER="$HERE/test-model-load.sh" ;;
    audio)  TESTER="$HERE/test-audio-model-load.sh" ;;
    vision) TESTER="$HERE/test-vision-model-load.sh" ;;
    *) echo "unknown --mode $MODE (expected text|audio|vision)" >&2; exit 2 ;;
esac

RESULTS_FILE="$1"; shift
MODEL_IDS=("$@")
if [ "${#MODEL_IDS[@]}" -eq 0 ]; then
    echo "usage: test-ik-llama-cpp-models.sh [--mode text|audio|vision] RESULTS_JSONL_FILE MODEL_ID [MODEL_ID ...]" >&2
    exit 2
fi

> "$RESULTS_FILE"
LOG_DIR="$(mktemp -d)"
echo "logs: $LOG_DIR"

for model in "${MODEL_IDS[@]}"; do
    echo "testing: $model"

    resolved=$(MODEL_ID="$model" INVENTORY="$INVENTORY" python3 -c "
import json, os
d = json.load(open(os.environ['INVENTORY']))
for cat, entries in d['categories'].items():
    for e in entries:
        if e['id'] == os.environ['MODEL_ID']:
            src = os.path.expanduser(e['source_dir'])
            model_path = os.path.join(src, e['model_file'])
            mmproj_path = os.path.join(src, e['mmproj_file']) if e.get('mmproj_file') else ''
            print(model_path)
            print(mmproj_path)
            raise SystemExit
")
    model_path=$(echo "$resolved" | sed -n '1p')
    mmproj_path=$(echo "$resolved" | sed -n '2p')

    if [ -z "$model_path" ] || [ ! -f "$model_path" ]; then
        echo "  -> could not resolve path for $model, skipping"
        echo "{\"model\":\"$model\",\"status\":\"skipped\",\"http_code\":null,\"total_elapsed_s\":null,\"error\":\"could not resolve model path from inventory\"}" >> "$RESULTS_FILE"
        continue
    fi

    LAUNCH_LOG="$LOG_DIR/$(echo "$model" | tr '/' '_').log"

    LAUNCH_START=$(date +%s.%N)
    # bash 3.2 (macOS default) throws "unbound variable" under `set -u` when
    # expanding a zero-element array ("${arr[@]}"), so branch instead of
    # relying on an always-declared (possibly empty) MMPROJ args array.
    if [ -n "$mmproj_path" ] && [ -f "$mmproj_path" ]; then
        nohup "$IK_BIN" --host 127.0.0.1 --port "$PORT" --model "$model_path" --alias "$model" \
            --ctx-size 4096 -ngl 80 --jinja --mmproj "$mmproj_path" > "$LAUNCH_LOG" 2>&1 &
    else
        nohup "$IK_BIN" --host 127.0.0.1 --port "$PORT" --model "$model_path" --alias "$model" \
            --ctx-size 4096 -ngl 80 --jinja > "$LAUNCH_LOG" 2>&1 &
    fi
    SERVER_PID=$!

    nohup "$HERE/mem-watchdog.sh" "$LOG_DIR/watchdog-$(echo "$model" | tr '/' '_').log" "$SERVER_PID" 30 > /dev/null 2>&1 &
    WATCHDOG_PID=$!

    READY=false
    for i in $(seq 1 60); do
        sleep 2
        if ! kill -0 "$SERVER_PID" 2>/dev/null; then
            break
        fi
        if curl -s -o /dev/null -w "" --max-time 2 "http://127.0.0.1:$PORT/v1/models" 2>/dev/null; then
            code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 2 "http://127.0.0.1:$PORT/v1/models" 2>/dev/null)
            if [ "$code" = "200" ]; then
                READY=true
                break
            fi
        fi
    done
    LAUNCH_END=$(date +%s.%N)
    load_time_s=$(echo "$LAUNCH_END - $LAUNCH_START" | bc)

    if ! $READY; then
        echo "  -> failed to come up, see $LAUNCH_LOG"
        err=$(tail -5 "$LAUNCH_LOG" | tr '\n' ' ' | sed 's/"/\\"/g')
        echo "{\"model\":\"$model\",\"status\":\"failed\",\"http_code\":null,\"total_elapsed_s\":$load_time_s,\"error\":\"server did not become ready: $err\"}" >> "$RESULTS_FILE"
    else
        RESULT=$(bash "$TESTER" "$model" "$PORT" 150)
        # Override load_time_s with the real launch-to-ready duration (the
        # tester's own value reflects a single already-loaded request).
        RESULT=$(MODEL_LOAD_TIME="$load_time_s" python3 -c "
import json, os
r = json.loads('''$RESULT''')
r['load_time_s'] = round(float(os.environ['MODEL_LOAD_TIME']), 1)
print(json.dumps(r))
")
        echo "$RESULT" >> "$RESULTS_FILE"
        echo "  -> $RESULT"
    fi

    kill "$WATCHDOG_PID" 2>/dev/null
    lsof -ti :"$PORT" | xargs -r kill 2>/dev/null
    sleep 1
    lsof -ti :"$PORT" | xargs -r kill -9 2>/dev/null
done

echo "done. results: $RESULTS_FILE"
echo "logs: $LOG_DIR"
