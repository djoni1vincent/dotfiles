#!/usr/bin/env bash

SOCKET="/tmp/ncspot-$(id -u)/ncspot.sock"

[ ! -S "$SOCKET" ] && sketchybar --set "$NAME" drawing=off && exit 0

# Python handles everything: socket read + JSON parse + sketchybar call
python3 - "$SOCKET" "$NAME" <<'EOF'
import socket, json, subprocess, sys

sock_path, item_name = sys.argv[1], sys.argv[2]

def hide():
    subprocess.run(["sketchybar", "--set", item_name, "drawing=off"])

# Read from ncspot IPC socket
s = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
s.settimeout(1)
try:
    s.connect(sock_path)
    raw = s.recv(8192).decode("utf-8").strip()
finally:
    s.close()

if not raw:
    hide(); sys.exit()

try:
    d = json.loads(raw)
except json.JSONDecodeError:
    hide(); sys.exit()

mode = list(d.get("mode", {}).keys())[0] if d.get("mode") else "Stopped"
p    = d.get("playable") or {}
title  = p.get("title", "")
artists = p.get("artists", [])
artist = artists[0] if artists else ""

if not title or mode == "Stopped":
    hide(); sys.exit()

icon        = "a" if mode == "Paused" else "a"  # overridden below
label_color = "0xFFaaaaaa"

if mode == "Playing":
    icon        = "󰝚"   # nf-md-music_note
    label_color = "0xFFaaaaaa"
elif mode == "Paused":
    icon        = "󰏤"   # nf-md-pause
    label_color = "0xFF555555"
else:
    hide(); sys.exit()

label = f"{artist} — {title}" if artist else title
if len(label) > 40:
    label = label[:39] + "…"

subprocess.run([
    "sketchybar", "--set", item_name,
    "drawing=on",
    f"icon={icon}",
    f"label={label}",
    f"label.color={label_color}",
])
EOF
