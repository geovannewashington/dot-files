#!/bin/bash

# Check if the file is passed and exists
if [[ -f "$1" ]]; then
  gcc "$1" -o "${1%.*}" -lcs50 && chmod +x ./"${1%.*}"
else
  echo "File '$1' not found!"
fi

# Reminder to practice manual compilation occasionally
echo "" 
echo "Remember: Manual Compilation for C: gcc filename.c -o filename && ./filename"
