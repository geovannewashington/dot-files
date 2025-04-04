#!/bin/bash

# Check if a username is provided
if [ -z "$1" ]; then
    echo "Usage: yt-chat <channel_name>"
    echo "Example: yt-chat LofiGirl"
    exit 1
fi

CHANNEL_NAME="$1"
BROWSER="google-chrome" # Change to "firefox" if needed

# Find the latest live video ID
VIDEO_ID=$(curl -s "https://www.youtube.com/@$CHANNEL_NAME/live" | grep -o 'watch?v=[^"]*' | head -n 1 | cut -d'=' -f2)

# If a live stream is found, open the popout chat
if [[ -n "$VIDEO_ID" ]]; then
    $BROWSER --new-window "https://www.youtube.com/live_chat?is_popout=1&v=$VIDEO_ID"
else
    echo "No active live stream found for $CHANNEL_NAME."
fi
