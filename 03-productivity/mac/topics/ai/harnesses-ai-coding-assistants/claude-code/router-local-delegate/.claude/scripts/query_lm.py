#!/usr/bin/env python3
"""
Query a local LM Studio model via the OpenAI-compatible API.

Usage:
    query_lm.py [OPTIONS] PROMPT
    query_lm.py --list-models

Options:
    --model MODEL      Model ID (default: mlx-community/qwen3.5-35b-a3b)
    --think            Enable extended reasoning (default: off for speed)
    --max-tokens N     Max response tokens (default: 1000)
    --system SYS       System prompt
    --url URL          LM Studio base URL (default: http://localhost:11444)
    --list-models      List available models and exit

Notes:
    - Use --think for tasks that benefit from step-by-step reasoning.
    - Prompt can also be piped via stdin (content is prepended to the prompt).
    - Uses only Python stdlib — no pip dependencies required.
"""

import sys
import json
import urllib.request
import urllib.error
import argparse

LMSTUDIO_URL = "http://localhost:11444"
DEFAULT_MODEL = "mlx-community/qwen3.5-35b-a3b"


def list_models(
                base_url
                ):
    req = urllib.request.Request(f"{base_url}/v1/models")
    try:
        with urllib.request.urlopen(req, timeout=10) as resp:
            data = json.loads(resp.read())
        for m in data.get("data", []):
            print(m["id"])
    except urllib.error.URLError:
        print(f"Error: Cannot connect to LM Studio at {base_url}", file=sys.stderr)
        sys.exit(1)


def query(
            prompt: str,
            model: str,
            think,
            max_tokens,
            system,
            base_url
        ):
    messages = []
    if system:
        messages.append(
                            {
                                "role": "system", 
                                "content": system
                            }
                        )
    messages.append(
                        {
                            "role": "user",
                            "content": prompt
                        }
                    )

    payload = json.dumps(
                            {
                                "model": model,
                                "messages": messages,
                                "max_tokens": max_tokens,
                                "temperature": 0.7,
                                "stream": False,
                            }
                        ).encode()

    req = urllib.request.Request(
                                    f"{base_url}/v1/chat/completions",
                                    headers={"Content-Type": "application/json"},
                                    method="POST",
                                    data=payload,
                                )

    with urllib.request.urlopen(req, timeout=720) as resp:
        r = json.loads(resp.read())

    msg = r["choices"][0]["message"]
    content = msg.get("content", "").strip()
    reasoning = msg.get("reasoning_content", "").strip()

    if think and reasoning:
        print(f"<thinking>\n{reasoning}\n</thinking>\n", file=sys.stderr)

    if content:
        return content
    elif reasoning:
        # Hit token limit before producing a final answer
        return f"[Hit token limit during reasoning — try --max-tokens with a higher value]\n\n{reasoning}"
    else:
        return "[No response content returned]"


def main():
    parser = argparse.ArgumentParser(
                                        description="Query a local LM Studio model",
                                        formatter_class=argparse.RawDescriptionHelpFormatter,
                                        epilog=__doc__,
                                    )
    parser.add_argument("prompt", nargs="?", help="Prompt to send to the model")
    parser.add_argument(
        "--model", default=DEFAULT_MODEL,
        help=f"Model ID (default: {DEFAULT_MODEL})"
    )
    parser.add_argument(
        "--think", action="store_true",
        help="Enable extended reasoning (slower but better for hard problems)"
    )
    parser.add_argument(
        "--max-tokens", type=int, default=1000, dest="max_tokens",
        help="Max response tokens (default: 1000)"
    )
    parser.add_argument(
        "--system", default="",
        help="System prompt"
    )
    parser.add_argument(
        "--url", default=LMSTUDIO_URL,
        help=f"LM Studio base URL (default: {LMSTUDIO_URL})"
    )
    parser.add_argument(
        "--list-models", action="store_true", dest="list_models",
        help="List available models and exit"
    )

    args = parser.parse_args()

    if args.list_models:
        list_models(args.url)
        return

    # If stdin is piped, treat it as file/context content and combine with prompt
    if not sys.stdin.isatty():
        stdin_content = sys.stdin.read().strip()
        if args.prompt:
            args.prompt = f"{stdin_content}\n\n{args.prompt}"
        else:
            args.prompt = stdin_content
    elif not args.prompt:
        parser.error("PROMPT is required (or pipe content via stdin)")

    try:
        result = query(
            args.prompt,
            args.model,
            args.think,
            args.max_tokens,
            args.system,
            args.url,
        )
        print(result)
    except urllib.error.URLError as e:
        print(f"Error: Cannot connect to LM Studio at {args.url}", file=sys.stderr)
        print("  Make sure LM Studio is running with 'Local Server' enabled.", file=sys.stderr)
        print(f"  Details: {e}", file=sys.stderr)
        sys.exit(1)
    except KeyError:
        print("Error: Unexpected API response format", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()