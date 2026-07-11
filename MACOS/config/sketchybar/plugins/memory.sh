#!/usr/bin/env bash

PAGE=16384   # Apple Silicon page size
TOTAL=$(sysctl -n hw.memsize 2>/dev/null || echo 17179869184)

used_pages=$(vm_stat 2>/dev/null | awk '
  /Pages active/              { gsub(/\./, "", $3); a=$3 }
  /Pages wired down/          { gsub(/\./, "", $4); w=$4 }
  /Pages occupied by compressor/ { gsub(/\./, "", $5); c=$5 }
  END { print a+w+c }
')
used_pages=${used_pages:-0}

used=$(( used_pages * PAGE ))
pct=$(awk "BEGIN{printf \"%.0f\", $used * 100 / $TOTAL}")
used_gb=$(awk "BEGIN{printf \"%.1f\", $used / 1073741824}")

if   [ "$pct" -ge 85 ]; then COLOR=0xFFe06c75
elif [ "$pct" -ge 65 ]; then COLOR=0xFFe8a87c
else                         COLOR=0xFF888888
fi

sketchybar --set "$NAME" label="${used_gb}G" icon.color=$COLOR label.color=$COLOR
