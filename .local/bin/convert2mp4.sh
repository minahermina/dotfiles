#!/bin/sh
infile=$1
printf "Enter the file name:" 
read outfile
ffmpeg -i "$infile" -vcodec libx264 -acodec aac -movflags +faststart -preset fast -crf 28 -vf "scale=640:-2" "$outfile"

