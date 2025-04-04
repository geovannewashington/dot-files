#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <platform> <username_or_channel_id>"
    exit 1
fi

PLATFORM=$1
USERNAME=$2

# Validate platform and construct stream URL
case "$PLATFORM" in
twitch)
    STREAM_URL="https://www.twitch.tv/$USERNAME"
    ;;
youtube)
    STREAM_URL="https://www.youtube.com/@$USERNAME/live"
    ;;
*)
    echo "Error: Unsupported platform. Supported platforms: twitch, youtube."
    exit 1
    ;;
esac

# Run streamlink with mpv (better compatibility than Totem)
streamlink "$STREAM_URL" best --player "mpv"
