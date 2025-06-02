#!/bin/sh
set -xe

# i use this script in my Xorg environment

# Set the output file name and path
output_file="$HOME/hdd/D/Mina/recordings/screencast_$(date +"%Y_%m_%d_%H_%M_%S").mkv"

# Set the screen size
start_recording() {
    # Use slop to get the geometry for the region to be recorded
    geometry=$(slop -f "%x %y %w %h")

    # Parse the geometry
    set -- $geometry
    x=$1
    y=$2
    height=$4
    width=$3


    echo "Starting recording..."
    (sleep 0.2 && pkill -RTMIN+22 dwmblocks) &

    pactl load-module module-echo-cancel use_master_format=1 aec_method=webrtc source_name=noise_cancel_source
    # Run ffmpeg with the selected region
    ffmpeg \
        -f x11grab -framerate 120 -video_size "${width}x${height}" -i :0.0+$x,$y \
        -f pulse -i alsa_output.pci-0000_05_00.6.analog-stereo.monitor \
        -f pulse -i noise_cancel_source \
        -filter_complex "[2:a]volume=2.0[mic]; [1:a][mic]amix=inputs=2[aout]" \
        -map 0:v -map "[aout]" \
        -c:v h264_nvenc -preset fast -qp 23 \
        -c:a aac -b:a 192k \
        "$output_file"
}

stop_recording() {
    echo "Stopping recording..."
    pkill ffmpeg

    # Wait for ffmpeg to fully terminate
    while pgrep -x ffmpeg >/dev/null; do
        sleep 0.1
    done

    pkill -RTMIN+22 dwmblocks
}

main(){
    process_name="ffmpeg"

    # Check if ffmpeg is already running
    if pgrep -x "$process_name" > /dev/null; then
        choice=$(printf "Yes\nNo" | dmenu -i -p "Stop Recording?")

        if [ "$choice" = "Yes" ]; then
            stop_recording
            exit 0
        fi
    fi

    start_recording

}

main
