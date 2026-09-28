#!/usr/bin/env python3
"""
Run a tool-calling agent loop with a local LM Studio model.

The model can read files and list directories itself — no need to pipe
file content through Claude's context first.

Usage:
    agent_lm.py [OPTIONS] "task description"

Options:
    --model MODEL                       Model ID (default: mlx-community/qwen3.5-35b-a3b)
    --dir DIR                           Working directory the model can access (default: cwd)
    --max-tokens N                      Max tokens per response (default: 2000)
    --max-turns N                       Max agent loop iterations (default: 10)
    --think                             Enable reasoning mode
    --url URL                           LM Studio base URL (default: http://localhost:1234)

Example:
    agent_lm.py --dir /path/to/project "summarize solar-system.html"
    agent_lm.py --dir . "find all TODO comments and list them"
    agent_lm.py --dir . "review app.py for bugs"
"""

import sys
import json
import os
import urllib.request
import urllib.error
import argparse
from pathlib import Path

LMSTUDIO_URL = "http://localhost:1234"
DEFAULT_MODEL = "mlx-community/qwen3.5-35b-a3b"

TOOLS = [
            {
                "type": "function",
                "function": 
                {
                    "name": "read_file",
                    "description": "Read the contents of a file in the working directory.",
                    "parameters": 
                    {
                        "type": "object",
                        "properties": 
                        {
                            "path": 
                            {
                                "type": "string",
                                "description": "File path relative to the working directory, or absolute.",
                            }
                        },
                        "required": ["path"],
                    },
                },
            },
    {
        "type": "function",
        "function": 
        {
            "name": "list_dir",
            "description": "List files and directories at a path in the working directory.",
            "parameters": 
            {
                "type": "object",
                "properties": 
                {
                    "path": 
                    {
                        "type": "string",
                        "description": "Directory path relative to the working directory. Use '.' for root.",
                    }
                },
                "required": ["path"],
            },
        },
    },
]


def execute_tool(
                    name: str,
                    args: str,
                    work_dir: str
                ):
    """
    Execute a tool call and return the result string.
    """
    try:
        if name == "read_file":
            p = Path(args["path"])
            if not p.is_absolute():
                p = work_dir / p
            p = p.resolve()
            # Safety: only allow reads within work_dir
            if not str(p).startswith(str(work_dir.resolve())):
                return f"Error: path '{args['path']}' is outside the working directory."
            if not p.exists():
                return f"Error: file '{args['path']}' does not exist."
            content = p.read_text(errors="replace")
            # Cap at ~12000 chars to stay within context limits
            if len(content) > 12000:
                content = content[:6000] + "\n\n...[truncated]...\n\n" + content[-4000:]
            return content

        elif name == "list_dir":
            p = Path(args["path"])
            if not p.is_absolute():
                p = work_dir / p
            p = p.resolve()
            if not str(p).startswith(str(work_dir.resolve())):
                return f"Error: path '{args['path']}' is outside the working directory."
            if not p.is_dir():
                return f"Error: '{args['path']}' is not a directory."
            entries = sorted(p.iterdir(), key=lambda x: (x.is_file(), x.name))
            lines = []
            for e in entries:
                kind = "DIR " if e.is_dir() else "FILE"
                lines.append(f"{kind}  {e.name}")
            return "\n".join(lines) if lines else "(empty)"

        else:
            return f"Error: unknown tool '{name}'"
    except Exception as e:
        return f"Error executing {name}: {e}"


def chat(
        messages,
        model,
        max_tokens,
        think,
        base_url
        ):
    """
    Send messages to LM Studio and return the response dict.
    """
    payload = json.dumps(
                            {
                                "model": model,
                                "messages": messages,
                                "tools": TOOLS,
                                "tool_choice": "auto",
                                "max_tokens": max_tokens,
                                "temperature": 0.5,
                                "stream": False,
                            }
                        ).encode()

    req = urllib.request.Request(
                                    f"{base_url}/v1/chat/completions",
                                    headers=
                                            {
                                                "Content-Type": "application/json"
                                            },
                                    method="POST",
                                    data=payload,
                                )
    with urllib.request.urlopen(req, timeout=180) as resp:
        return json.loads(resp.read())


def run_agent(
                task,
                model,
                work_dir,
                max_tokens,
                max_turns,
                think,
                base_url
            ):
    messages = [
                    {
                        "role": "system",
                        "content": (
                                        f"You are a helpful coding assistant. "
                                        f"Your working directory is: {work_dir}\n"
                                        "Use the read_file and list_dir tools to access files as needed. "
                                        "When you have enough information, provide your final answer directly."
                                    ),
                    },
                    {
                        "role": "user",
                        "content": task
                    },
                ]

    for turn in range(max_turns):
        print(f"[turn {turn + 1}]", file=sys.stderr)
        r = chat(messages, model, max_tokens, think, base_url)
        msg = r["choices"][0]["message"]
        finish = r["choices"][0]["finish_reason"]

        # Add assistant message to history
        messages.append(msg)

        tool_calls = msg.get("tool_calls") or []

        if not tool_calls or finish == "stop":
            # Final answer
            content = msg.get("content", "").strip()
            if content:
                return content
            # Fallback: return reasoning if no content
            reasoning = msg.get("reasoning_content", "").strip()
            if reasoning:
                return f"[reasoning only]\n{reasoning}"
            return "[No response]"

        # Execute tool calls and feed results back
        for tc in tool_calls:
            fn = tc["function"]
            name = fn["name"]
            try:
                args = json.loads(fn["arguments"])
            except json.JSONDecodeError:
                args = {}
            print(f"  → {name}({args})", file=sys.stderr)
            result = execute_tool(name, args, work_dir)
            messages.append({
                "role": "tool",
                "tool_call_id": tc["id"],
                "content": result,
            })

    return "[Agent reached max turns without a final answer]"


def main():
    parser = argparse.ArgumentParser(
        description="Tool-calling agent loop with a local LM Studio model",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__,
    )
    parser.add_argument("task", help="Task description for the agent")
    parser.add_argument("--model", default=DEFAULT_MODEL)
    parser.add_argument("--dir", default=".", help="Working directory (default: cwd)")
    parser.add_argument("--max-tokens", type=int, default=2000, dest="max_tokens")
    parser.add_argument("--max-turns", type=int, default=10, dest="max_turns")
    parser.add_argument("--think", action="store_true")
    parser.add_argument("--url", default=LMSTUDIO_URL)

    args = parser.parse_args()
    work_dir = Path(args.dir).resolve()

    if not work_dir.is_dir():
        print(f"Error: --dir '{args.dir}' is not a valid directory", file=sys.stderr)
        sys.exit(1)

    try:
        result = run_agent(
            args.task,
            args.model,
            work_dir,
            args.max_tokens,
            args.max_turns,
            args.think,
            args.url,
        )
        print(result)
    except urllib.error.URLError as e:
        print(f"Error: Cannot connect to LM Studio at {args.url}", file=sys.stderr)
        print("  Make sure LM Studio is running with 'Local Server' enabled.", file=sys.stderr)
        sys.exit(1)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()