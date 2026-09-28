#!/usr/bin/env python3
"""Splits models-inventory.json into one file per category, for faster
special-purpose loading (e.g. a code-only agent doesn't need to parse the
speech/OCR entries too).

models-inventory.json remains the single source of truth -- these are
derived, regeneratable views. Re-run this after any change to the master
file (new models, new test results, etc.).

Usage: split-inventory.py
"""
import json

DIR = "/Users/moljac/bat/03-productivity/mac/topics/ai/hosts-providers-backends/llama.cpp"
MASTER_PATH = f"{DIR}/models-inventory.json"

# category key in models-inventory.json -> output filename suffix
FILENAME_MAP = {
    "general_chat": "general-chat",
    "code": "code",
    "ocr": "ocr",
    "speech_asr_tts": "speech_asr_tts",
    "embeddings": "embeddings",
}


def main():
    with open(MASTER_PATH) as f:
        master = json.load(f)

    written = []
    for cat_key, filename_suffix in FILENAME_MAP.items():
        entries = master["categories"].get(cat_key, [])
        out_path = f"{DIR}/models-inventory.{filename_suffix}.json"
        out = {
            "category": cat_key,
            "generated_from": "models-inventory.json (source of truth -- do not hand-edit this split file, edit the master and re-run split-inventory.py)",
            "generated_by": master.get("generated_by"),
            "router_models_dir": master.get("router_models_dir"),
            "router_port": master.get("router_port"),
            "notes": master.get("notes"),
            "models": entries,
        }
        with open(out_path, "w") as f:
            json.dump(out, f, indent=2)
            f.write("\n")
        written.append((out_path, len(entries)))

    for path, count in written:
        print(f"{path}: {count} models")


if __name__ == "__main__":
    main()
