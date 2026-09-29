"""Best-effort probe of context-size data for an already-loaded model on a
running backend server. Imported by test-model-load.sh, test-vision-model-load.sh,
and test-audio-model-load.sh (added to sys.path via the TEST_HERE env var)
right after a successful test, so models-inventory.json can carry:

  context_size      the context length the model was ACTUALLY LOADED with
                     for this test run (e.g. --ctx-size at launch, or
                     whatever a router/LM Studio picked on its own)
  context_size_max  the model's native/trained max context length, when the
                     backend's API exposes it

Every value here comes from a real HTTP response from the server under
test -- never inferred or guessed. A field stays None when the backend's
API doesn't expose it, which is itself a real (if incomplete) finding, not
an error.

Response shapes handled, discovered by reading each backend's own server
source:
  llama.cpp (router + manual serve) GET /v1/models:
      data[0].meta.n_ctx / data[0].meta.n_ctx_train
  ik_llama.cpp                      GET /v1/models:
      data[0].max_model_len (loaded) / data[0].meta.n_ctx_train (native)
  LM Studio                         GET /api/v0/models:
      entry.max_context_length (native, documented)
      entry.loaded_context_length (loaded, opportunistic -- not documented,
      only recorded when actually present in the response)
  universal fallback                GET /props:
      default_generation_settings.n_ctx (loaded only, no native max)
"""
import json
import urllib.request


def _get_json(url, timeout):
    try:
        with urllib.request.urlopen(url, timeout=timeout) as resp:
            return json.loads(resp.read().decode("utf-8"))
    except Exception:
        return None


def _find_entry(data_list, model_id):
    if not data_list:
        return None
    for entry in data_list:
        if entry.get("id") == model_id:
            return entry
    return data_list[0] if len(data_list) == 1 else None


def probe_context(port, model_id, timeout=5):
    base = f"http://127.0.0.1:{port}"
    context_size = None
    context_size_max = None

    body = _get_json(f"{base}/v1/models", timeout)
    entry = _find_entry((body or {}).get("data"), model_id)
    if entry:
        meta = entry.get("meta") or {}
        context_size = meta.get("n_ctx", entry.get("max_model_len"))
        context_size_max = meta.get("n_ctx_train")

    if context_size is None and context_size_max is None:
        body = _get_json(f"{base}/api/v0/models", timeout)
        entry = _find_entry((body or {}).get("data"), model_id)
        if entry:
            context_size_max = entry.get("max_context_length")
            context_size = entry.get("loaded_context_length")

    if context_size is None:
        body = _get_json(f"{base}/props", timeout)
        if body:
            dgs = body.get("default_generation_settings") or {}
            context_size = dgs.get("n_ctx", body.get("n_ctx"))

    return {"context_size": context_size, "context_size_max": context_size_max}
