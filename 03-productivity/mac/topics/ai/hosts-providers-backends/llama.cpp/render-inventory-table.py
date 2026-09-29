#!/usr/bin/env python3
"""Renders models-inventory.json as a per-backend performance comparison
table (size + load time + prompt tok/s + gen tok/s for each backend), as a
GitHub-flavored markdown table, or exports the same data as JSON, YAML, or
CSV.

Usage:
    render-inventory-table.py [options]

Options:
    --input FILE        inventory JSON to read (default: models-inventory.json
                         next to this script; also accepts a split file like
                         models-inventory.code.json)
    --category NAME      filter to one category (general_chat, code, ocr,
                          speech_asr_tts, embeddings). Default: all.
    --backends LIST       comma-separated backend keys to include, in order.
                          Default: llama_cpp_router,lm_studio,ik_llama_cpp
    --format FORMAT       table (default), markdown, json, yaml, or csv
    --output FILE          write to FILE instead of stdout
    --sort {none,id,size}  row order. Default: none (inventory order)

Status legend in table mode: a real value means "working" with that number;
"X" means the backend was tested and rejected (real failure); "-" means
untested or not_configured (no data either way).
"""
import argparse
import csv
import io
import json
import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
DEFAULT_INPUT = os.path.join(HERE, "models-inventory.json")
DEFAULT_BACKENDS = ["llama_cpp_router", "lm_studio", "ik_llama_cpp"]
BACKEND_LABELS = {
    "llama_cpp_router": "Router",
    "lm_studio": "LM Studio",
    "ik_llama_cpp": "ik_llama.cpp",
}

STATUS_ICON = {"working": None, "rejected": "X", "untested": "-", "not_configured": "-"}


def _size_to_bytes(size_str):
    if not size_str:
        return 0
    size_str = size_str.strip()
    units = {"K": 1024, "M": 1024**2, "G": 1024**3, "T": 1024**4}
    unit = size_str[-1].upper()
    if unit in units:
        try:
            return float(size_str[:-1]) * units[unit]
        except ValueError:
            return 0
    try:
        return float(size_str)
    except ValueError:
        return 0


def load_models(input_path, category):
    with open(input_path) as f:
        data = json.load(f)

    if "categories" in data:
        cats = data["categories"]
        if category:
            if category not in cats:
                sys.exit(f"unknown category {category!r}; have: {', '.join(cats)}")
            cats = {category: cats[category]}
        models = []
        for cat_name, entries in cats.items():
            for e in entries:
                e = dict(e)
                e["category"] = cat_name
                models.append(e)
        return models
    else:
        # a split file: {"category": ..., "models": [...]}
        entries = data.get("models", [])
        for e in entries:
            e.setdefault("category", data.get("category"))
        return entries


def sort_models(models, sort_by):
    if sort_by == "id":
        return sorted(models, key=lambda m: m["id"])
    if sort_by == "size":
        return sorted(models, key=lambda m: _size_to_bytes(m.get("size_on_disk")))
    return models


def build_rows(models, backends):
    """Returns a list of dicts: flat, export-friendly rows."""
    rows = []
    for m in models:
        row = {
            "id": m["id"],
            "category": m.get("category"),
            "size_on_disk": m.get("size_on_disk"),
        }
        b = m.get("backends", {})
        for backend in backends:
            info = b.get(backend, {})
            prefix = backend
            row[f"{prefix}_status"] = info.get("status", "untested")
            row[f"{prefix}_load_time_s"] = info.get("load_time_s")
            row[f"{prefix}_prompt_tokens_per_second"] = info.get("prompt_tokens_per_second")
            row[f"{prefix}_gen_tokens_per_second"] = info.get("gen_tokens_per_second")
            row[f"{prefix}_context_size"] = info.get("context_size")
            row[f"{prefix}_context_size_max"] = info.get("context_size_max")
        rows.append(row)
    return rows


def fmt_cell(row, backend, field):
    status = row[f"{backend}_status"]
    if status != "working":
        icon = STATUS_ICON.get(status, "-")
        return icon if field == "load_time_s" else ""
    val = row[f"{backend}_{field}"]
    if val is None:
        # working, but this modality's endpoint has no timing breakdown
        # (e.g. audio transcription) -- distinct from untested/rejected.
        return "OK" if field == "load_time_s" else "n/a"
    if field == "load_time_s":
        return f"{val}s"
    return f"{val}"


def build_table_rows(rows, backends):
    table_rows = []
    for row in rows:
        line = [row["id"], row.get("size_on_disk") or ""]
        for backend in backends:
            line.append(fmt_cell(row, backend, "load_time_s"))
            line.append(fmt_cell(row, backend, "prompt_tokens_per_second"))
            line.append(fmt_cell(row, backend, "gen_tokens_per_second"))
        table_rows.append(line)
    return table_rows


LEGEND = "Legend: real value = working (with that number) | OK/n/a = working but this endpoint reports no timing breakdown (e.g. audio) | X = tested and rejected | - = untested/not_configured"


def render_table(rows, backends):
    headers_top = ["Model", "Size"]
    headers_bottom = ["", ""]
    for backend in backends:
        label = BACKEND_LABELS.get(backend, backend)
        headers_top += [label, "", ""]
        headers_bottom += ["Load", "Prompt tok/s", "Gen tok/s"]

    table_rows = build_table_rows(rows, backends)

    ncols = len(headers_top)
    widths = [0] * ncols
    for col in range(ncols):
        cand = [headers_top[col], headers_bottom[col]] + [r[col] for r in table_rows]
        widths[col] = max(len(str(c)) for c in cand)
    widths = [max(w, 3) for w in widths]

    def hline(left, mid, right, fill="─"):
        return left + mid.join(fill * (w + 2) for w in widths) + right

    def row_line(cells):
        return "│" + "│".join(f" {str(c):<{widths[i]}} " for i, c in enumerate(cells)) + "│"

    out = []
    out.append(hline("┌", "┬", "┐"))
    out.append(row_line(headers_top))
    out.append(row_line(headers_bottom))
    out.append(hline("├", "┼", "┤"))
    for i, line in enumerate(table_rows):
        out.append(row_line(line))
        if i < len(table_rows) - 1:
            out.append(hline("├", "┼", "┤"))
    out.append(hline("└", "┴", "┘"))
    out.append("")
    out.append(LEGEND)
    return "\n".join(out)


def render_markdown(rows, backends):
    headers = ["Model", "Size"]
    for backend in backends:
        label = BACKEND_LABELS.get(backend, backend)
        headers += [f"{label} Load", f"{label} Prompt tok/s", f"{label} Gen tok/s"]

    table_rows = build_table_rows(rows, backends)

    def esc(cell):
        return str(cell).replace("|", "\\|") or " "

    esc_rows = [[esc(c) for c in line] for line in table_rows]

    # Pad every column to the same width (header, dash rule, and every data
    # cell) so the table also reads cleanly in a plain-text/raw view, not
    # just when rendered by a markdown viewer.
    ncols = len(headers)
    widths = [0] * ncols
    for col in range(ncols):
        cand = [headers[col]] + [r[col] for r in esc_rows]
        widths[col] = max(len(c) for c in cand)
    widths = [max(w, 3) for w in widths]

    def fmt_row(cells):
        return "| " + " | ".join(f"{c:<{widths[i]}}" for i, c in enumerate(cells)) + " |"

    out = []
    out.append(fmt_row(headers))
    out.append("|" + "|".join("-" * (w + 2) for w in widths) + "|")
    for line in esc_rows:
        out.append(fmt_row(line))
    out.append("")
    out.append(LEGEND)
    return "\n".join(out)


def render_json(rows):
    return json.dumps(rows, indent=2)


def render_yaml(rows):
    import yaml
    return yaml.dump(rows, sort_keys=False, allow_unicode=True)


def render_csv(rows):
    if not rows:
        return ""
    buf = io.StringIO()
    writer = csv.DictWriter(buf, fieldnames=list(rows[0].keys()))
    writer.writeheader()
    writer.writerows(rows)
    return buf.getvalue()


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--input", default=DEFAULT_INPUT)
    p.add_argument("--category", default=None)
    p.add_argument("--backends", default=",".join(DEFAULT_BACKENDS))
    p.add_argument("--format", choices=["table", "markdown", "json", "yaml", "csv"], default="table")
    p.add_argument("--output", default=None)
    p.add_argument("--sort", choices=["none", "id", "size"], default="none")
    args = p.parse_args()

    backends = [b.strip() for b in args.backends.split(",") if b.strip()]

    models = load_models(args.input, args.category)
    models = sort_models(models, args.sort)
    rows = build_rows(models, backends)

    if args.format == "table":
        text = render_table(rows, backends)
    elif args.format == "markdown":
        text = render_markdown(rows, backends)
    elif args.format == "json":
        text = render_json(rows)
    elif args.format == "yaml":
        text = render_yaml(rows)
    elif args.format == "csv":
        text = render_csv(rows)

    if args.output:
        with open(args.output, "w") as f:
            f.write(text)
            if not text.endswith("\n"):
                f.write("\n")
        print(f"wrote {args.output}", file=sys.stderr)
    else:
        sys.stdout.write(text if text.endswith("\n") else text + "\n")


if __name__ == "__main__":
    main()
