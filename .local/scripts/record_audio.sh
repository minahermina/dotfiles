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

pactl load-module module-echo-cancel use_master_format=1 aec_method=webrtc source_name=noise_cancel_source
ffmpeg -f pulse -i noise_cancel_source  -ac "$CHANNELS" -af "afftdn=nf=-25" "$OUTFILE"

