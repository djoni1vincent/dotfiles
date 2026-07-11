#!/usr/bin/env bash

# Read current input source directly from plist (faster than 'defaults read')
lang=$(python3 - <<'EOF'
import plistlib, os, sys
path = os.path.expanduser("~/Library/Preferences/com.apple.HIToolbox.plist")
try:
    with open(path, "rb") as f:
        p = plistlib.load(f)
    for s in p.get("AppleSelectedInputSources", []):
        name = s.get("KeyboardLayout Name", "")
        if name:
            print(name); sys.exit()
except Exception:
    pass
EOF
)

case "$lang" in
  "U.S."|*US*|*ABC*|*English*) label="EN" ;;
  *Russian*|*RussianWin*)       label="RU" ;;
  *Norwegian*)                  label="NO" ;;
  *)                            label="${lang:0:2}" ;;
esac

sketchybar --set "$NAME" label="$label"
