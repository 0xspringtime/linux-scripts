#!/bin/bash

# Change to the document directory
cd ~/Documents

# Define the file formats to try
formats=(".ods" ".xls" ".xlsx" ".csv" ".tsv")

# Check if the file extension is already included
if [[ "$1" != *.* ]]; then
  # Loop through the file formats and try to find a match
  for format in "${formats[@]}"; do
    if [ -f "$1$format" ]; then
      file="$1$format"
      break
    fi
  done
else
  file="$1"
fi

# Check if the file exists
if [ -f "$file" ]; then
  # Open the file with libreoffice
  libreoffice --calc "$file"
else
  # Print an error message if the file doesn't exist
  echo "Error: file $file not found."
fi

