#!/usr/bin/env bash

INTERFACE="en0"
CACHE="${TMPDIR}sketchybar_wifi"
mkdir -p "$CACHE"

# ipconfig is the reliable source on Apple Silicon (networksetup can fail)
ssid=$(ipconfig getsummary "$INTERFACE" 2>/dev/null | awk -F' : ' '/^  SSID /{print $2; exit}')

# Cumulative bytes (NR==2 = link-level row, col 7 = Ibytes, col 10 = Obytes)
read -r rx tx < <(netstat -I "$INTERFACE" -b 2>/dev/null | awk 'NR==2{print $7, $10}')
rx=${rx:-0}; tx=${tx:-0}

prev_rx=$(cat "$CACHE/rx" 2>/dev/null || echo "$rx")
prev_tx=$(cat "$CACHE/tx" 2>/dev/null || echo "$tx")
prev_time=$(cat "$CACHE/time" 2>/dev/null || date +%s)
now=$(date +%s)

dt=$(( now - prev_time )); [ "$dt" -lt 1 ] && dt=1

rx_rate=$(( (rx - prev_rx) / dt )); [ "$rx_rate" -lt 0 ] && rx_rate=0
tx_rate=$(( (tx - prev_tx) / dt )); [ "$tx_rate" -lt 0 ] && tx_rate=0

echo "$rx"  > "$CACHE/rx"
echo "$tx"  > "$CACHE/tx"
echo "$now" > "$CACHE/time"

fmt() {
  local b=$1
  if   [ "$b" -ge 1048576 ]; then awk "BEGIN{printf \"%.1fM\", $b/1048576}"
  elif [ "$b" -ge 1024 ];    then awk "BEGIN{printf \"%.0fK\", $b/1024}"
  else echo "${b}B"; fi
}

if [ -z "$ssid" ]; then
  sketchybar --set "$NAME" icon="󰤮" icon.color=0xFF555555 label="—"
else
  down=$(fmt "$rx_rate")
  up=$(fmt "$tx_rate")
  sketchybar --set "$NAME" icon="󰖩" icon.color=0xFFffffff label="↓${down}  ↑${up}"
fi
