#!/bin/sh

# Define your sink name here
SINK="alsa_output.pci-0000_05_00.6.analog-stereo"

# Get available ports for the sink
PORTS=$(pactl list sinks | awk -v sink="$SINK" '
  $0 ~ "Name: "sink {found=1}
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

echo "test"
CHOSEN=$(echo "$PORTS" | dmenu -l 3 -i -p "Select Audio Output:")

echo "$CHOSEN"
PORT=$(echo "$CHOSEN" | cut -d'|' -f1 | xargs)

if [ -n "$PORT" ]; then
    pactl set-sink-port "$SINK" "$PORT"
fi

