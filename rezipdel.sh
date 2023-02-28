#!/bin/bash

# Use current directory if no argument is provided
if [ $# -eq 0 ]; then
  dir="."
else
  dir="$1"
fi

# Loop through all unzipped folders in the directory
for folder in "$dir"/*; do
  if [ -d "$folder" ] && [ "${folder##*.}" != "zip" ]; then
    # Zip the folder and its contents
    zip -r "$folder.zip" "$folder"
    
    # Delete the unzipped folder and its contents
    rm -r "$folder"
  fi
done

