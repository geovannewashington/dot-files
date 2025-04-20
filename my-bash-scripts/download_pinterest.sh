#!/bin/bash

# Check if an argument (URL list file) was provided
if [[ -z "$1" ]]; then
    echo "❌ Error: No file provided."
    echo "Usage: $0 path/to/images.txt"
    exit 1
fi

# File with Pinterest URLs (passed as first argument)
URLS_FILE="$1"

# Folder to save images
DEST_DIR="/home/gvn/Pictures/pinterest"

# Create the destination folder if it doesn't exist
mkdir -p "$DEST_DIR"

# Function to extract image URL from Pinterest page
extract_image_url() {
    local url="$1"

    # Fetch the Pinterest page HTML using curl
    page_html=$(curl -s "$url")

    # Extract the image URL using jq or grep (you can modify the regex to match the exact Pinterest image URL pattern)
    image_url=$(echo "$page_html" | grep -oP 'https://i\.pinimg\.com/originals/\S+\.(jpg|jpeg|png)' | head -n 1)

    # If image URL is found, download it
    if [[ -n "$image_url" ]]; then
        echo "📥 Downloading: $image_url"
        wget --trust-server-names --content-disposition -P "$DEST_DIR" "$image_url"
    else
        echo "❌ No image found for $url"
    fi
}

# Download each non-empty line (Pinterest URL)
while IFS= read -r url; do
    if [[ -n "$url" ]]; then
        extract_image_url "$url"
    fi
done <"$URLS_FILE"

echo "✅ Done. All images saved to: $DEST_DIR"
