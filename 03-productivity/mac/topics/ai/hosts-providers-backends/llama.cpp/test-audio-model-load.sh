#!/bin/bash

# Sends test-fixtures/test-audio.wav ("Hello, this is a test.") to an
# already-running server's /v1/audio/transcriptions endpoint (OpenAI
# Whisper-compatible, multipart/form-data: model + file fields) to confirm a
# given ASR model id actually loads and transcribes. Prints a single JSON
# result line to stdout.
#
# The response has no "timings"/"stats" breakdown (unlike chat completions),
# so this fires the request TWICE: the first ("cold") includes one-time
# model load, the second ("warm", model now resident) is pure transcription
# time. load_time_s and gen_tokens_per_second are derived from the
# difference, the same isolation technique used for load-time in
# test-model-load.sh, just without a server-reported timings object to lean
# on.
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

do_request() {
    local tmpfile="$1"
    local start end
    start=$(date +%s.%N)
    local http_code
    http_code=$(curl -s --max-time "$TIMEOUT_S" "http://127.0.0.1:$PORT/v1/audio/transcriptions" \
        -F "model=$MODEL_ID" \
        -F "file=@$AUDIO_FILE" \
        -o "$tmpfile" \
        -w "%{http_code}")
    local curl_exit=$?
    end=$(date +%s.%N)
    echo "$http_code $curl_exit $(echo "$end - $start" | bc)"
}

TMPFILE1=$(mktemp)
TMPFILE2=$(mktemp)

read -r HTTP_CODE1 CURL_EXIT1 ELAPSED1 <<< "$(do_request "$TMPFILE1")"
read -r HTTP_CODE2 CURL_EXIT2 ELAPSED2 <<< "$(do_request "$TMPFILE2")"

TEST_MODEL_ID="$MODEL_ID" \
TEST_HTTP_CODE1="$HTTP_CODE1" TEST_CURL_EXIT1="$CURL_EXIT1" TEST_ELAPSED1="$ELAPSED1" TEST_BODY_FILE1="$TMPFILE1" \
TEST_HTTP_CODE2="$HTTP_CODE2" TEST_CURL_EXIT2="$CURL_EXIT2" TEST_ELAPSED2="$ELAPSED2" TEST_BODY_FILE2="$TMPFILE2" \
python3 << 'PYEOF'
import json, os

model = os.environ["TEST_MODEL_ID"]
http_code = os.environ["TEST_HTTP_CODE1"]
curl_exit1 = int(os.environ["TEST_CURL_EXIT1"])
curl_exit2 = int(os.environ["TEST_CURL_EXIT2"])
elapsed1 = round(float(os.environ["TEST_ELAPSED1"]), 2)
elapsed2 = round(float(os.environ["TEST_ELAPSED2"]), 2)
body_file1 = os.environ["TEST_BODY_FILE1"]
body_file2 = os.environ["TEST_BODY_FILE2"]
http_code2 = os.environ["TEST_HTTP_CODE2"]

status = "failed"
error = None
transcribed_text = None
input_tokens = None
output_tokens = None
load_time_s = None
gen_tokens_per_second = None

if curl_exit1 != 0:
    error = f"curl exit {curl_exit1} (timeout or connection error) on first request"
elif http_code != "200":
    try:
        with open(body_file1) as f:
            body = json.load(f)
        error = body.get("error", {}).get("message") or json.dumps(body)
    except Exception as e:
        error = f"unparseable response: {e}"
else:
    status = "working"
    try:
        with open(body_file1) as f:
            body1 = json.load(f)
        transcribed_text = body1.get("text")
        usage1 = body1.get("usage", {})
        input_tokens = usage1.get("input_tokens")
        output_tokens = usage1.get("output_tokens")
    except Exception:
        pass

    if curl_exit2 == 0 and http_code2 == "200":
        try:
            with open(body_file2) as f:
                body2 = json.load(f)
            usage2 = body2.get("usage", {})
            out2 = usage2.get("output_tokens")
            load_time_s = round(elapsed1 - elapsed2, 1)
            if out2 and elapsed2 > 0:
                gen_tokens_per_second = round(out2 / elapsed2, 1)
            # prefer the warm request's own transcript/token counts
            transcribed_text = body2.get("text", transcribed_text)
            input_tokens = usage2.get("input_tokens", input_tokens)
            output_tokens = out2 or output_tokens
        except Exception:
            pass

print(json.dumps({
    "model": model,
    "status": status,
    "http_code": http_code,
    "total_elapsed_s": elapsed1,
    "load_time_s": load_time_s,
    "gen_tokens_per_second": gen_tokens_per_second,
    "transcribed_text": transcribed_text,
    "input_tokens": input_tokens,
    "output_tokens": output_tokens,
    "error": error,
}))
PYEOF

rm -f "$TMPFILE1" "$TMPFILE2"
