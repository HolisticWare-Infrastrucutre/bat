#!/bin/bash

# Sends one small chat completion to an already-running llama-server router
# to confirm a given model id actually loads and generates, and prints a
# single JSON result line to stdout. Does NOT start/stop the router itself --
# see test-inventory-models.sh for the batch driver that does.
#
# Usage: test-model-load.sh MODEL_ID [PORT] [TIMEOUT_S]

MODEL_ID="$1"
PORT="${2:-11454}"
TIMEOUT_S="${3:-150}"

if [ -z "$MODEL_ID" ]; then
    echo '{"error":"MODEL_ID required"}' >&2
    exit 2
fi

TMPFILE=$(mktemp)
START=$(date +%s.%N)
HTTP_CODE=$(curl -s --max-time "$TIMEOUT_S" "http://127.0.0.1:$PORT/v1/chat/completions" \
    -H "Content-Type: application/json" \
    -d "{\"model\":\"$MODEL_ID\",\"messages\":[{\"role\":\"user\",\"content\":\"hi\"}],\"max_tokens\":10}" \
    -o "$TMPFILE" \
    -w "%{http_code}")
CURL_EXIT=$?
END=$(date +%s.%N)

TEST_MODEL_ID="$MODEL_ID" \
TEST_HTTP_CODE="$HTTP_CODE" \
TEST_CURL_EXIT="$CURL_EXIT" \
TEST_ELAPSED="$(echo "$END - $START" | bc)" \
TEST_BODY_FILE="$TMPFILE" \
python3 << 'PYEOF'
import json, os

model = os.environ["TEST_MODEL_ID"]
http_code = os.environ["TEST_HTTP_CODE"]
curl_exit = int(os.environ["TEST_CURL_EXIT"])
elapsed = round(float(os.environ["TEST_ELAPSED"]), 1)
body_file = os.environ["TEST_BODY_FILE"]

status = "failed"
error = None
prompt_tokens_per_second = None
gen_tokens_per_second = None
load_time_s = None

if curl_exit != 0:
    error = f"curl exit {curl_exit} (timeout or connection error)"
elif http_code == "200":
    status = "working"
    try:
        with open(body_file) as f:
            body = json.load(f)
        timings = body.get("timings", {})
        prompt_tokens_per_second = timings.get("prompt_per_second")
        gen_tokens_per_second = timings.get("predicted_per_second")
        # total_elapsed_s (curl round trip) includes one-time model load PLUS
        # prompt processing PLUS generation; subtract the latter two (from the
        # server's own timings, in ms) to isolate load time.
        inference_s = (timings.get("prompt_ms", 0) + timings.get("predicted_ms", 0)) / 1000
        load_time_s = round(elapsed - inference_s, 1)
    except Exception:
        pass
else:
    try:
        with open(body_file) as f:
            body = json.load(f)
        error = body.get("error", {}).get("message") or json.dumps(body)
    except Exception as e:
        error = f"unparseable response: {e}"

print(json.dumps({
    "model": model,
    "status": status,
    "http_code": http_code,
    "total_elapsed_s": elapsed,
    "load_time_s": load_time_s,
    "prompt_tokens_per_second": prompt_tokens_per_second,
    "gen_tokens_per_second": gen_tokens_per_second,
    "error": error,
}))
PYEOF

rm -f "$TMPFILE"
