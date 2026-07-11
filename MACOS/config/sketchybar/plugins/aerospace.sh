#!/usr/bin/env bash

# $1 = workspace ID this item represents
# $FOCUSED_WORKSPACE = newly focused workspace (set by aerospace trigger)

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" \
    drawing=on \
    label.color=0xFF000000 \
    background.color=0xFFffffff
else
  count=$(aerospace list-windows --workspace "$1" 2>/dev/null | grep -c .)
  if [ "$count" -gt 0 ]; then
    sketchybar --set "$NAME" \
      drawing=on \
      label.color=0xFF888888 \
      background.color=0x00000000
  else
    sketchybar --set "$NAME" drawing=off
  fi
fi
