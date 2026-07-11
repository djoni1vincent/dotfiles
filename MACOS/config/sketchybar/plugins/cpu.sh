#!/usr/bin/env bash

# top -l 1 gives one sample; sum user+sys for total active CPU %
cpu=$(top -l 1 -s 0 -n 0 2>/dev/null | awk '/CPU usage/ {
  gsub(/%.*/, "", $3)
  gsub(/%.*/, "", $5)
  printf "%.0f", $3 + $5
}')
cpu=${cpu:-0}

# Color shifts from gray → orange → red as load rises
if   [ "$cpu" -ge 80 ]; then COLOR=0xFFe06c75
elif [ "$cpu" -ge 50 ]; then COLOR=0xFFe8a87c
else                         COLOR=0xFF888888
fi

sketchybar --set "$NAME" label="${cpu}%" icon.color=$COLOR label.color=$COLOR
