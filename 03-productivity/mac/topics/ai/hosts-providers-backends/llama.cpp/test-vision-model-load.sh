#!/bin/bash

# Sends test-fixtures/test-image.png (rendered text "HELLO OCR TEST 12345")
# to an already-running llama-server router's /v1/chat/completions endpoint
# with an image_url content part (base64 data URL) to confirm a given
# vision/OCR model id actually loads and reads the image. Prints a single
# JSON result line to stdout.
#
# Usage: test-vision-model-load.sh MODEL_ID [PORT] [TIMEOUT_S]

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODEL_ID="$1"
PORT="${2:-11454}"
TIMEOUT_S="${3:-150}"
IMAGE_FILE="$HERE/test-fixtures/test-image.png"

if [ -z "$MODEL_ID" ]; then
    echo '{"error":"MODEL_ID required"}' >&2
    exit 2
fi
if [ ! -f "$IMAGE_FILE" ]; then
    echo "{\"error\":\"missing fixture $IMAGE_FILE\"}" >&2
    exit 2
fi

TMPFILE=$(mktemp)
REQFILE=$(mktemp)
B64=$(base64 -i "$IMAGE_FILE" | tr -d '\n')
MODEL_ID="$MODEL_ID" B64="$B64" python3 -c "
import json, os
print(json.dumps({
    'model': os.environ['MODEL_ID'],
    'messages': [{
        'role': 'user',
        'content': [
            {'type': 'text', 'text': 'Read the text in this image.'},
            {'type': 'image_url', 'image_url': {'url': 'data:image/png;base64,' + os.environ['B64']}},
        ],
    }],
    'max_tokens': 30,
}))
" > "$REQFILE"

START=$(date +%s.%N)
HTTP_CODE=$(curl -s --max-time "$TIMEOUT_S" "http://127.0.0.1:$PORT/v1/chat/completions" \
    -H "Content-Type: application/json" \
    -d @"$REQFILE" \
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
ocr_text = None
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
        ocr_text = body["choices"][0]["message"]["content"]
        timings = body.get("timings", {})
        prompt_tokens_per_second = timings.get("prompt_per_second")
        gen_tokens_per_second = timings.get("predicted_per_second")
        inference_s = (timings.get("prompt_ms", 0) + timings.get("predicted_ms", 0)) / 1000
        load_time_s = round(elapsed - inference_s, 1)
    except Exception as e:
        error = f"200 but unparseable response: {e}"
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
    "ocr_text": ocr_text,
    "error": error,
}))
PYEOF

rm -f "$TMPFILE" "$REQFILE"
