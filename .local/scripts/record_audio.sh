#!/bin/sh

# Usage: ./record.sh [stereo|mono] [output_path]

MODE="$1"
OUTFILE="$2"

CHANNELS=2

if [ "$MODE" = "mono" ]; then
  CHANNELS=1
elif [ "$MODE" = "stereo" ]; then
  CHANNELS=2
else
  echo "Usage: $0 [stereo|mono] [output_path]"
  exit 1
fi

if [ -z "$OUTFILE" ]; then
  echo "Output file path is required."
  echo "Usage: $0 [stereo|mono] [output_path]"
  exit 1
fi

ffmpeg -f pulse -i alsa_input.pci-0000_05_00.6.analog-stereo -ac "$CHANNELS" "$OUTFILE"


