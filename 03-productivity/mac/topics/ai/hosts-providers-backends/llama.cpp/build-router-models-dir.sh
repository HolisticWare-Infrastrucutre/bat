#!/bin/bash

# Rebuilds a one-level symlink farm that llama-server router mode can scan
# via --models-dir. Router mode's directory scan is NOT recursive past one
# level, so real caches like ~/.lmstudio/models/<org>/<repo>/file.gguf (two
# levels deep) are invisible to it directly. This script flattens every
# discovered model folder to org__repo one level under ROUTER_DIR, which
# router mode then picks up with id = folder name, auto-pairing any
# mmproj-*.gguf via --mmproj and auto-detecting *-00001-of-000NN.gguf
# multipart shards (only the first part needs to be referenced).
#
# Re-run this any time a new model is downloaded into one of the source
# roots below.

ROUTER_DIR="${LLAMA_CPP_MODELS_DIR:-$HOME/.cache/llama-router-models}"
SOURCE_ROOTS=(
    "$HOME/.lmstudio/models"
    "$HOME/.ollama/models"
    "$HOME/.cache/huggingface"
    "$HOME/.omlx/models"
)

mkdir -p "$ROUTER_DIR"

# Track which links we (re)create this run so stale ones can be pruned.
seen_links=()

for root in "${SOURCE_ROOTS[@]}"; do
    [ -d "$root" ] || continue

    # Find every directory that directly contains at least one *.gguf file.
    while IFS= read -r -d '' dir; do
        org="$(basename "$(dirname "$dir")")"
        repo="$(basename "$dir")"

        # Non-mmproj gguf files directly in this directory.
        mains=()
        while IFS= read -r -d '' f; do
            base="$(basename "$f")"
            case "$base" in
                mmproj*) ;;  # skip, router auto-pairs these
                *) mains+=("$f") ;;
            esac
        done < <(find "$dir" -maxdepth 1 -type f -iname "*.gguf" -print0)

        [ "${#mains[@]}" -eq 0 ] && continue

        # Are all "mains" parts of one multipart shard set (or just one file)?
        is_single_model=true
        if [ "${#mains[@]}" -gt 1 ]; then
            for f in "${mains[@]}"; do
                if ! [[ "$(basename "$f")" =~ -[0-9]{5}-of-[0-9]{5}\.gguf$ ]]; then
                    is_single_model=false
                    break
                fi
            done
        fi

        if $is_single_model; then
            link="$ROUTER_DIR/${org}__${repo}"
            ln -sf "$dir" "$link"
            seen_links+=("$(basename "$link")")
        else
            # Distinct standalone quantizations in one folder (not shards of
            # the same model) -> one symlinked file per model instead of a
            # whole-directory link.
            # NOTE: router mode's directory scan requires the symlink's own
            # filename to end in .gguf to be discovered as a candidate at
            # all (it filters by name, not by resolving the symlink first),
            # but it then STRIPS that same .gguf suffix when deriving the
            # model id. So the link must keep the .gguf suffix even though
            # the usable id (e.g. for a models-inventory.json entry) is the
            # extension-stripped form -- confirmed empirically 2026-09-28.
            for f in "${mains[@]}"; do
                stem="$(basename "$f" .gguf)"
                link="$ROUTER_DIR/${org}__${repo}__${stem}.gguf"
                ln -sf "$f" "$link"
                seen_links+=("$(basename "$link")")
            done
        fi
    done < <(find "$root" -type f -iname "*.gguf" -exec dirname {} \; | sort -u | tr '\n' '\0')
done

# Prune links that no longer correspond to anything found this run.
for existing in "$ROUTER_DIR"/*; do
    [ -e "$existing" ] || continue
    name="$(basename "$existing")"
    keep=false
    for s in "${seen_links[@]}"; do
        [ "$s" = "$name" ] && keep=true && break
    done
    $keep || rm -f "$existing"
done

echo "router models dir: $ROUTER_DIR"
echo "entries: $(ls "$ROUTER_DIR" | wc -l | tr -d ' ')"
ls "$ROUTER_DIR"
