#!/bin/bash

# Set the directory containing the WebP files
input_dir="./" # Change this to your specific directory if needed

# Create a directory for the GIFs if it doesn't exist
output_dir="${input_dir}/gifs"
mkdir -p "$output_dir"

# Loop through all .webp files in the specified directory
for webp_file in "$input_dir"/*.webp; do
        # Check if the file exists
        if [[ -f "$webp_file" ]]; then
                # Get the filename without the extension
                filename=$(basename "$webp_file" .webp)

                # Check if the GIF already exists
                if [[ ! -f "$output_dir/$filename.gif" ]]; then
                # Convert WebP to GIF
                convert "$webp_file" "$output_dir/$filename.gif"
                echo "Converted $webp_file to $output_dir/$filename.gif"
                else
                echo "GIF for $webp_file already exists."
                fi
        else
                echo "No .webp files found in the directory."
                break
        fi
done

