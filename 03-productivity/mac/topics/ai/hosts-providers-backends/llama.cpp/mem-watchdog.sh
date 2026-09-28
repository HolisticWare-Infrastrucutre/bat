#!/bin/bash

# Watches macOS memory pressure while a big model loads/runs and force-kills
# the given PID (and its children) if pressure hits "critical"
# (kern.memorystatus_vm_pressure_level == 4) on two consecutive 10s checks.
# "warn" (2) is logged but not fatal -- only sustained "critical" kills.
#
# Usage: mem-watchdog.sh LOG_FILE WATCHED_PID [MAX_CHECKS]
#   MAX_CHECKS: number of 10s checks before the watchdog gives up and exits
#               cleanly (default 30 => 5 minute window).

LOG="$1"
WATCHED_PID="$2"
MAX_CHECKS="${3:-30}"

CRITICAL_HITS=0
for i in $(seq 1 "$MAX_CHECKS"); do
    sleep 10
    level=$(sysctl -n kern.memorystatus_vm_pressure_level 2>/dev/null)
    swap=$(sysctl -n vm.swapusage 2>/dev/null)
    free_pages=$(vm_stat 2>/dev/null | awk '/Pages free/ {gsub("\\.","",$3); print $3}')
    echo "$(date +%T) level=$level free_pages=$free_pages swap=[$swap]" >> "$LOG"

    if [ "$level" = "4" ]; then
        CRITICAL_HITS=$((CRITICAL_HITS + 1))
    else
        CRITICAL_HITS=0
    fi

    if [ "$CRITICAL_HITS" -ge 2 ]; then
        echo "$(date +%T) CRITICAL pressure sustained -- killing watched PID $WATCHED_PID and children" >> "$LOG"
        pkill -9 -P "$WATCHED_PID" 2>/dev/null
        kill -9 "$WATCHED_PID" 2>/dev/null
        echo "$(date +%T) killed" >> "$LOG"
        exit 1
    fi

    if ! kill -0 "$WATCHED_PID" 2>/dev/null; then
        echo "$(date +%T) watched process no longer running, stopping watchdog" >> "$LOG"
        exit 0
    fi
done

echo "$(date +%T) watchdog window elapsed ($MAX_CHECKS checks), exiting" >> "$LOG"
