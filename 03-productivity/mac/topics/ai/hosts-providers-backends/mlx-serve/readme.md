# `mlx-serve`

```
~/.mlx-serve/models
```

```
[mem] MLX buffer-pool cap 8192 MB (was 124518 MB)
mlx-serve — MLX inference server for Apple Silicon

Usage: mlx-serve <command> [options]
       mlx-serve [options]

Commands:
  run <model>         Download if needed, serve it, and chat right here
                      (short name like "gemma4", "qwen3.6:27b", or any
                      HuggingFace "org/repo")
  pull <model>        Download a model into ~/.mlx-serve/models
  list                Show downloaded models
  serve               Start the server over ~/.mlx-serve/models
                      (every pulled model loads on demand by name)
  launch <agent>      Configure + launch a coding agent CLI against the
                      local server (claude, pi, omp, opencode, codex,
                      hermes, aider); starts the MLX Core app if the
                      server is down. `mlx-serve launch <agent> -h` for
                      options

Options:
  --model <dir>       Path to MLX model directory
  --serve             Start HTTP server mode
  --host <ip>         Bind address (default: 0.0.0.0 — open to the local
                      network; a future version will default to 127.0.0.1)
  --port <n>          Bind port (default: 11234)
  --ctx-size <n>      Maximum context length (default: model max)
  --config-overrides <json>   JSON object deep-merged into EVERY
                      model's config.json this process loads or
                      discovers (alias: --hf-overrides). Generic keys
                      like max_position_embeddings hit everything.
                      HF attention_factor replaces the computed YaRN
                      mscale; vLLM attn_factor multiplies it.
                      e.g. '{"text_config":{"rope_parameters":{"rope_type":
                      "yarn","factor":4.0,"original_max_position_embeddings":
                      262144},"max_position_embeddings":1048576}}'
  --embedding-max-length <n>  Per-input token ceiling for /v1/embeddings
                      (default auto = the model's declared window; over-limit
                      inputs get a 400 naming index/count/limit, never truncation)
  --prompt <text>     Run single prompt (interactive mode)
  --stream            Stream tokens as they are generated (with --prompt)
  --max-tokens <n>    Max tokens to generate (default: 100); in --serve
                      mode, the default for requests that omit the field
  --temp <f>          Temperature. Offline: sampling temp (default 0.0).
                      Serve: default for requests that omit `temperature`
                      (otherwise the model's generation_config.json, then 1.0)
  --top-p <f>         Serve-mode default top_p for requests that omit it
                      (otherwise generation_config.json, then 1.0 = off)
  --top-k <n>         Serve-mode default top_k for requests that omit it
                      (otherwise generation_config.json, then 0 = off)
  --timeout <n>       Stall timeout in seconds: abort a request after n seconds
                      WITHOUT producing a token (default: 300, 0=none). A request
                      that keeps generating never times out, however long it runs.
  --reasoning-budget <n>  Max thinking tokens per request (default: unlimited)
  --no-vision         Disable vision encoder (saves memory)
  --no-prevent-sleep  Allow Mac idle sleep during inference and model
                      loads. Display sleep is always allowed.
  --os-reserve-gib <n>  Free RAM left out of every memory plan so macOS keeps
                        room (default: an eighth of RAM, 2 to 8 GB). 0 turns
                        it off: more context and concurrency, but a small Mac
                        under heavy load can freeze or restart.
  --skip-mem-preflight  Bypass the model-load free-RAM pre-flight that
                        refuses a load whose weights + warmup headroom
                        look too big for current free memory. The check
                        is conservative (macOS reclaims file cache as
                        MLX allocates); use this if a load you know fits
                        is being refused. A genuine over-commit can
                        hard-crash the server.
  --pld               Enable Prompt Lookup Decoding (default: ON).
                        Model-agnostic speculative decoding via n-gram
                        matches in the prompt + generated tokens. Big
                        wins on echo-heavy workloads (code editing, RAG,
                        agentic loops). Adaptive prompt-time gate
                        auto-disables it on novel content. Pass
                        --no-pld to force-disable.
  --no-pld            Force-disable Prompt Lookup Decoding.
  --pld-draft-len <n> Max draft tokens per PLD step (default: 5).
  --pld-key-len <n>   N-gram match key length for PLD (default: 3).
  --drafter <dir>     Path to an assistant drafter checkpoint —
                        either a Gemma 4 cross-attention drafter or
                        a DFlash block-drafter (auto-detected from
                        its config: block_size + mask_token_id +
                        target_layer_ids). Loaded at startup, bound
                        to the target model, default draft source
                        for new requests (priority: MTP > dflash >
                        drafter > PLD > regular).
  --draft-block-size <n>  Tokens per drafter round. Gemma default is
                        auto-detected per target (E2B=2, E4B=4,
                        26B-A4B=4, 31B=8); DFlash uses its config's
                        block_size (an explicit value only clamps
                        it DOWN). Pass to override.
  --no-drafter        Never load a speculative-decoding drafter, including
                      one shipped inside the checkpoint (drafter/ subdir)
  --no-mtp            Disable the Qwen native MTP head (auto-loaded
                        when the model dir ships mtp/weights.safetensors;
                        priority: MTP > drafter > PLD).
  --ane-prefill       Offload a share of each prefill chunk's dense
                        MLP rows to the Neural Engine (qwen3_5-family
                        only; int8/fp16, lossy; needs >= 96 GB RAM).
                        MLX_SERVE_ANE_SPLIT tunes the share (0.40).
  --ane-image         Run a share of each image DiT block's MLP on the
  --ane-video           Neural Engine beside the GPU (Krea / MiniMax-H3 /
  --ane-audio           ACE-Step; int8/fp16, lossy; off by default). The
                        share is calibrated once per Mac and model on
                        the first request (~1 s) and reused; the server
                        declines by name where the copy does not fit.
  --ane-split <f>     Force the media offload's ANE share (0..1) instead
                        of calibrating it per model (MLX_SERVE_ANE_SPLIT is the same).
  --mtp               Force the MTP head ON for MoE targets too.
                        Requests default to MTP only on DENSE models;
                        a MoE checkpoint that ships a sidecar is
                        otherwise reachable only via `enable_mtp:true`
                        in the request body.
  --mtp-head-kv-quant Quantize the qwen4 MTP head's own KV with
                        --kv-quant (default OFF: the head keeps
                        dense bf16 KV).
  --dspark            Enable DeepSeek-V4 DSpark draft stages (OFF by
                        default: the stages cost ~11 GB resident; the
                        memory fit-gate still applies at load). For a
                        served .gguf this arms the embedded ds4
                        engine's DSpark runtime instead, using the
                        DSpark support GGUF found beside the model
                        (greedy requests only; needs the sidecar,
                        so --no-ds4-mtp disables it too).
  --decode-attn-quant / --no-decode-attn-quant
                      Serve decode from quantized side copies of
                      DENSE (bf16/f16) attention projection weights:
                      INT8 group-32 for most layers, NVFP4 for the
                      last 20% (late layers amplify quantization
                      error far less). Cuts their per-token weight
                      read by half or more on models that ship dense
                      attention (e.g. Laguna, ~-25% decode overall).
                      LOSSY: a real requantization, applied to
                      decode/verify steps only; prefill keeps the
                      dense weights. Default ON; --no-… restores
                      exact dense decode. Env tuning:
                      MLX_SERVE_DECODE_ATTN_QUANT_NVFP4_FROM=<layer>
                      moves the 4-bit boundary, =off keeps the whole
                      stack INT8.
  --mtp-depth <n>     Max tokens drafted per MTP round (default:
                        adaptive — the EV controller plans depth
                        per round up to 8 on eligible M5 NAX targets,
                        otherwise 6; MLX_SERVE_MTP_ADAPTIVE=0
                        reverts to the fixed windowed controller,
                        cap 3). Pass an explicit <n> to hard-cap.
  --mtp-typical <d>  Opt-in lossy typical MTP acceptance (d > 0).
                        Use 0.2 for the Qwen3.8 matched comparison.
  --mtp-tokenv3 <a>  Opt-in lossy TokenV3 cascade (0 <= a <= 1).
                        Alias: --mtp-cascade. Use 0.95 for the
                        Qwen3.8 matched comparison. Exclusive with
                        --mtp-typical; exact is the default.
  --max-mtp-ctx <n>   Keep MTP speculative decoding OFF past <n>
                        context tokens (default: 0 = no ceiling).
                        A verify row is BYTES, so on a long-context
                        trunk a round can cost more than the serial
                        steps it replaces. A request whose prompt is
                        past <n> decodes serially, and one that
                        GENERATES past it switches mid-flight. The
                        bound is inclusive (<n> itself still drafts)
                        and it outranks `enable_mtp:true` in the
                        request body. MTP only — PLD, the drafter
                        and DFlash/DSpark are unaffected.
  --mtp-history-window <n>
                      MTP prefill-history window: prompts forwarding
                        more than 16384 tokens only build head history
                        for the last <n> (default: 0 = full history;
                        windowing costs acceptance on stock Qwen heads).
  --kv-quant <mode>   KV-cache quantization scheme:
                        off (default), 4, 8     — affine group quant.
                          Per-request override via the `kv_quant`
                          body field.
  --kv-attn-mode {{auto|dense|fused}}
                      Decode read path for quantized KV. `dense`
                        dequantizes K/V before SDPA; `fused` reads
                        the packed cache in place at decode width
                        (spec verify + prefill always read dense);
                        `auto` (default) picks fused from 8K prompt
                        tokens. Only effective at --kv-quant 4 or 8;
                        per-request `kv_attn_mode` field overrides.
  --prefill-chunk <n> Max tokens forwarded per prefill chunk
                        (default: 8192). Auto-capped further per model
                        so one layer's attention scores stay within
                        budget; this flag is the ceiling, not a floor.
                        Lower it if a long prompt spikes memory.
  --prefix-cache-entries <n>
                      Hot prefix cache LRU capacity in entries
                        (default: 32). 0 disables the cache — which also
                        turns off SSM checkpoint capture, since
                        checkpoints exist only to feed it.
  --prefix-cache-mem <n>{{KB,MB,GB}}
                      Hot prefix cache KV-bytes budget (default: 2GB).
                      Evicts LRU entries until the budget fits.
                      Pass 0/off to disable the byte budget.
  --prefix-cache-disk <n>{{KB,MB,GB}}
                      SSD tier for the prefix cache (default: off).
                      Seen prefixes persist under ~/.mlx-serve/kv-cache
                        and are restored across restarts and RAM
                        evictions instead of recomputed. Can use many
                        GB of disk, so it's opt-in; e.g. 10GB. 0/off
                        disables.
  --ssm-checkpoint-stride <n>
                      Hybrid SSM architectures only (e.g. Qwen3.5/3.6
                        GDN): capture an SSM/conv state checkpoint every
                        <n> tokens during chunked prefill, so a later
                        request sharing a prefix can restore mid-prompt
                        instead of re-prefilling (default: 256). 0
                        disables capture — hybrid models then bypass the
                        hot prefix cache entirely. On MoE targets the
                        effective stride is raised to the prefill chunk,
                        because each checkpoint forces a chunk boundary
                        and every extra chunk re-streams the expert
                        weights; see --prefill-chunk.
  --ssm-checkpoint-max <n>
                      Cap on SSM checkpoints retained per cache entry
                        (default: 16). The first stride-aligned position
                        is always kept; beyond the cap the oldest are
                        dropped. 0 = unlimited, bounded only by the
                        prefix cache's byte budget.
  --wired-margin-gib <n>
                      How far under iogpu.wired_limit_mb a plan may
                        reach (default: 8, integers 2..32).
  --tokenize-cache-entries <n>
                      Per-model LRU cache of chat-template render +
                        tokenize results (default: 4). Skips re-
                        rendering identical messages on warm reuse.
                        0 disables.
  --llama-cache-entries <n>
                      For GGUF models served via llama.cpp, the max
                        number of resident KV sessions (default: 4).
                        N > 1 keeps the N most-recently-used prompts
                        hot so alternating multi-doc workloads don't
                        cold-prefill on every flip.
  --engine {{auto|ds4|llama}}
                      Engine selector for `.gguf` inputs ONLY.
                        Safetensors models always run on the native
                        MLX engine and ignore this flag. For
                        GGUF: `auto` (default) reads the file's
                        `general.architecture` metadata and routes
                        ds4-converted quants (DeepSeek V4/V4.1, Qwen3.8
                        Flash Next, GLM 5.x) to the embedded ds4
                        engine, everything else to llama.cpp.
                        Override when auto-detection is wrong
                        (e.g. an unusual ds4 quant whose metadata
                        layout differs).
  --ssd-streaming     ds4 / DeepSeek-V4-Flash only: stream expert
                        weights from SSD instead of holding the whole
                        model in RAM (skips full residency + warmup).
                        Use when the model is larger than available
                        memory. Ignored by the MLX + llama.cpp engines.
  --no-ds4-mtp        ds4 only: don't auto-load the MTP draft head
                        (speculative decode). On by default when the
                        model dir ships one; auto-off under
                        --ssd-streaming (ds4 refuses the combination).
  --model-dir <dir>   Directory of MLX models to discover at startup.
                        Discovered siblings appear in /v1/models and
                        can be loaded on-demand via /v1/load-model
                        (or by sending a request with model=<id>).
                        REPEATABLE (up to 8) — pass it once per folder
                        your models live in. Scanned in order; the
                        first folder wins a repeated model id, and a
                        folder that can't be opened is skipped.
  --max-resident-models <n>
                      Maximum loaded models in memory (default: 3).
                        ensureLoaded evicts LRU before exceeding.
  --max-resident-mem <n>{{KB,MB,GB}}|auto
                      Summed resident-bytes cap across all loaded
                        models. Default 'auto' = 80% of MLX wired
                        limit at startup. Pass 0 to disable.
  --idle-evict-secs <n>
                      Evict .ready entries with refcount==0 if
                        idle for this many seconds. Default: off.
  --metrics           Enable Prometheus metrics at GET /metrics and a
                        live metrics panel on the index page (opt-in;
                        zero cost when off). Also GET /metrics.json.
  --no-tool-autocorrect
                      Disable tool-call ARGUMENT auto-correct — the
                        coercion of parsed args to the tool schema's
                        declared types (e.g. Python `False` -> JSON
                        `false`). Args then pass through as the model
                        emitted them (still valid JSON). Default: on.
  --api-key <token>   Require this key on every request (OpenAI/
                        Anthropic/Ollama APIs + index page + metrics).
                        Accepts Authorization: Bearer, x-api-key, HTTP
                        Basic (key = password), or ?api_key=. /health
                        stays open. Unset = no auth (default).
  --api-key-strict    Require the key from loopback too (localhost is
                        exempt by default). For embedders that want
                        "only the key holder drives inference" on a
                        shared machine. No effect without --api-key.
  --api-key-env <VAR> Read the key from environment variable VAR
                        instead of argv (the process table is
                        world-readable). Unset/empty VAR = no auth.
  --lan-share <all|id,...>
                      Share models with the local network: advertise
                        this server over Bonjour and let LAN clients
                        run inference on the listed models (or all).
                        Everything else stays host-local. Off by
                        default. Prompts sent to shared models are
                        visible to this machine.
  --lan-discover      Discover models other mlx-serve hosts share on
                        the LAN: they appear in /v1/models as
                        <id>@<peer> and requests naming one are
                        proxied to that host. Off by default.
  --lan-name <name>   Bonjour instance name for --lan-share
                        (default: this Mac's hostname).
  --log-level <lvl>   Log level: error, warn, info, debug (default: info)
  --log-file <path>   Persist the server log ("off" disables).
                      Default: ~/.mlx-serve/logs/mlx-serve-<port>.log
  --version           Print version and exit
  --help              Show this help
```