#!/usr/bin/env bash

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

[ -z "$PERCENTAGE" ] && exit 0

if [ -n "$CHARGING" ]; then
  ICON="󰂄"
  COLOR=0xFF888888
elif [ "$PERCENTAGE" -ge 90 ]; then
  ICON="󰁹"; COLOR=0xFF888888
elif [ "$PERCENTAGE" -ge 65 ]; then
  ICON="󰂁"; COLOR=0xFF888888
elif [ "$PERCENTAGE" -ge 40 ]; then
  ICON="󰁿"; COLOR=0xFF888888
elif [ "$PERCENTAGE" -ge 20 ]; then
  ICON="󰁼"; COLOR=0xFFe8a87c
else
  ICON="󰁺"; COLOR=0xFFe06c75
fi

sketchybar --set "$NAME" \
  icon="$ICON" \
  icon.color=$COLOR \
  label="${PERCENTAGE}%" \
  label.color=$COLOR
