#!/usr/bin/env python3
"""Merge JSONL results from test-inventory-models.sh (or a manual test loop)
into models-inventory.json's backends.<name> field.

Usage: merge-test-results.py RESULTS_JSONL_FILE [--backend NAME] [--id-map MAPPING_JSON] [--date YYYY-MM-DD]

--backend NAME: which backends.<name> to write (default: llama_cpp_router)
--id-map MAPPING_JSON: path to a JSON object {inventory_id: backend_specific_model_id}
    used when the tested backend's own model id differs from the inventory's
    canonical id (e.g. LM Studio uses its own catalog ids). Each result
    line's "model" field is matched against the mapping's VALUES to find the
    inventory entry to update. Without --id-map, result "model" values are
    matched directly against inventory ids (the llama.cpp router case, where
    they're the same by construction).
"""
import json
import sys
from datetime import date

INVENTORY_PATH = "/Users/moljac/bat/03-productivity/mac/topics/ai/hosts-providers-backends/llama.cpp/models-inventory.json"


def _round_or_none(v, ndigits=1):
    return round(v, ndigits) if isinstance(v, (int, float)) else None


def main():
    results_path = sys.argv[1]
    backend_name = "llama_cpp_router"
    id_map_path = None
    test_date = date.today().isoformat()
    for i, arg in enumerate(sys.argv):
        if arg == "--date" and i + 1 < len(sys.argv):
            test_date = sys.argv[i + 1]
        if arg == "--backend" and i + 1 < len(sys.argv):
            backend_name = sys.argv[i + 1]
        if arg == "--id-map" and i + 1 < len(sys.argv):
            id_map_path = sys.argv[i + 1]

    # tested_model_id -> inventory_id (identity unless --id-map given)
    tested_to_inventory = {}
    if id_map_path:
        with open(id_map_path) as f:
            inventory_to_tested = json.load(f)
        tested_to_inventory = {v: k for k, v in inventory_to_tested.items()}

    results = {}
    with open(results_path) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            r = json.loads(line)
            tested_id = r["model"]
            inventory_id = tested_to_inventory.get(tested_id, tested_id) if id_map_path else tested_id
            results[inventory_id] = r

    with open(INVENTORY_PATH) as f:
        data = json.load(f)

    updated = []
    for cat, entries in data["categories"].items():
        for entry in entries:
            r = results.get(entry["id"])
            if not r:
                continue
            status_map = {"working": "working", "failed": "rejected", "skipped": "untested"}
            status = status_map.get(r["status"], "untested")
            entry["backends"].setdefault(backend_name, {})
            entry["backends"][backend_name] = {
                "status": status,
                "load_time_s": r.get("load_time_s"),
                "total_elapsed_s": r.get("total_elapsed_s", r.get("elapsed_s")),
                "prompt_tokens_per_second": _round_or_none(r.get("prompt_tokens_per_second")),
                "gen_tokens_per_second": _round_or_none(r.get("gen_tokens_per_second") or r.get("tokens_per_second")),
                # context_size: ctx the model was actually loaded with for this
                # test run. context_size_max: the model's native/trained max
                # context, when the backend's API exposes it. Both come from
                # context_probe.py's best-effort GET against the live server --
                # None means the backend's API just doesn't expose it.
                "context_size": r.get("context_size"),
                "context_size_max": r.get("context_size_max"),
                # audio-specific (test-audio-model-load.sh, /v1/audio/transcriptions)
                "transcribed_text": r.get("transcribed_text"),
                "input_tokens": r.get("input_tokens"),
                "output_tokens": r.get("output_tokens"),
                # vision-specific (test-vision-model-load.sh, /v1/chat/completions + image_url)
                "ocr_text": r.get("ocr_text"),
                "notes": (r.get("error") or "") + (f" [tested backend id: {r['model']}]" if id_map_path else ""),
                "tested_at": test_date,
            }
            if not entry["backends"][backend_name]["notes"]:
                entry["backends"][backend_name]["notes"] = None
            updated.append(entry["id"])

    with open(INVENTORY_PATH, "w") as f:
        json.dump(data, f, indent=2)
        f.write("\n")

    print(f"updated backends.{backend_name} for {len(updated)} entries: {', '.join(updated)}")


if __name__ == "__main__":
    main()
