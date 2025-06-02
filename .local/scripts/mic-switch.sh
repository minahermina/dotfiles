#!/bin/bash

# Get default source; fallback to first source if default not set
SOURCE=$(pactl get-default-source 2>/dev/null)
if [ -z "$SOURCE" ]; then
    SOURCE=$(pactl list short sources | head -n 1 | awk '{print $2}')
fi

if [ -z "$SOURCE" ]; then
    notify-send "No input sources found"
    exit 1
fi

# Get available ports for the source
PORTS=$(pactl list sources | awk -v source="$SOURCE" '
  $0 ~ "Name: "source {found=1}
  found && /Ports:/ {ports=1; next}
  ports && /^[^[:space:]]/ {exit}
  ports && /^[ \t]+[a-z0-9\-]+:/ {
    port=$1
    sub(":", "", port)
    desc = $0
    sub(/^[ \t]+[a-z0-9\-]+: /, "", desc)
    print port " | " desc
  }
')

if [ -z "$PORTS" ]; then
    notify-send "No input ports available for $SOURCE"
    exit 1
fi

# Let the user pick a port via dmenu
CHOSEN=$(echo "$PORTS" | dmenu -i -p "Select Microphone Input:")

if [ -z "$CHOSEN" ]; then
    notify-send "No input selected"
    exit 1
fi

# Extract port name before " | "
PORT=$(echo "$CHOSEN" | cut -d'|' -f1 | xargs)

# Switch to the selected port
if pactl set-source-port "$SOURCE" "$PORT"; then
    notify-send "Microphone input switched to" "$CHOSEN"
else
    notify-send "Failed to switch microphone input to" "$CHOSEN"
fi

