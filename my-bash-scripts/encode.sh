#!/bin/bash

# Create a directory for transcoded files if it doesn't exist
mkdir -p transcoded

# Loop through all .mp4 files in the current directory
for i in *.mp4; do
    # Check if the .mov file already exists
    if [[ ! -f "transcoded/${i%.*}.mov" ]]; then
        # Convert MP4 to MOV
        ffmpeg -i "$i" -vcodec mjpeg -q:v 2 -acodec pcm_s16be -q:a 0 -f mov "transcoded/${i%.*}.mov"
        echo "Converted $i to transcoded/${i%.*}.mov"
    else
        echo "MOV for $i already exists."
    fi
done

