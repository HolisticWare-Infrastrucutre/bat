#!/bin/bash

# Sends test-fixtures/test-audio.wav ("Hello, this is a test.") to an
# already-running llama-server router's /v1/audio/transcriptions endpoint
# (OpenAI Whisper-compatible, multipart/form-data: model + file fields) to
# confirm a given ASR model id actually loads and transcribes. Prints a
# single JSON result line to stdout.
#
# Usage: test-audio-model-load.sh MODEL_ID [PORT] [TIMEOUT_S]

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODEL_ID="$1"
PORT="${2:-11454}"
TIMEOUT_S="${3:-150}"
AUDIO_FILE="$HERE/test-fixtures/test-audio.wav"

if [ -z "$MODEL_ID" ]; then
    echo '{"error":"MODEL_ID required"}' >&2
    exit 2
fi
if [ ! -f "$AUDIO_FILE" ]; then
    echo "{\"error\":\"missing fixture $AUDIO_FILE\"}" >&2
    exit 2
fi

TMPFILE=$(mktemp)
START=$(date +%s.%N)
HTTP_CODE=$(curl -s --max-time "$TIMEOUT_S" "http://127.0.0.1:$PORT/v1/audio/transcriptions" \
    -F "model=$MODEL_ID" \
    -F "file=@$AUDIO_FILE" \
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
transcribed_text = None
input_tokens = None
output_tokens = None

if curl_exit != 0:
    error = f"curl exit {curl_exit} (timeout or connection error)"
elif http_code == "200":
    status = "working"
    try:
        with open(body_file) as f:
            body = json.load(f)
        transcribed_text = body.get("text")
        usage = body.get("usage", {})
        input_tokens = usage.get("input_tokens")
        output_tokens = usage.get("output_tokens")
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
    "transcribed_text": transcribed_text,
    "input_tokens": input_tokens,
    "output_tokens": output_tokens,
    "error": error,
}))
PYEOF

rm -f "$TMPFILE"
