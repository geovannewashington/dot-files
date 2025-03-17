#!/bin/bash

wallpaper_dir='/home/gvn/Pictures/DailyWallpapers'
seen_file='/home/gvn/.wallpaper_seen'  # File to keep track of which wallpapers have been shown

# Get the list of all wallpapers in the directory
wallpapers=($(ls -p "$wallpaper_dir" | grep -v '/'))

# Check if the file with seen wallpapers exists, if not, create it
if [ ! -f "$seen_file" ]; then
    touch "$seen_file"
    echo "0" > "$seen_file"  # Start from the first wallpaper
fi

# Read the index of the last wallpaper shown
current_index=$(cat "$seen_file")

# Select the wallpaper based on the current index
selected_wallpaper="${wallpapers[$current_index]}"

# Set the wallpaper
gsettings set org.gnome.desktop.background picture-uri "file://$wallpaper_dir/$selected_wallpaper"

# Update the index to point to the next wallpaper
next_index=$((current_index + 1))

# If we've reached the end, loop back to the first wallpaper
if [ "$next_index" -ge "${#wallpapers[@]}" ]; then
    next_index=0
fi

# Save the new index to the file
echo "$next_index" > "$seen_file"
