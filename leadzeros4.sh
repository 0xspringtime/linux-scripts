#!/bin/bash

# Loop through all files in the current directory
for file in [0-9]*.*; do
  # Check if the file name matches the expected pattern
  if [[ "$file" =~ ^([0-9]{1,3})(\.[^\.]+)$ ]]; then
    # Extract the number and file extension
    num=${BASH_REMATCH[1]}
    ext=${BASH_REMATCH[2]}
    
    # Add leading zeros to make the number 4 digits long
    newnum=$(printf "%04d" $num)
    
    # Rename the file with the new number and extension
    mv "$file" "$newnum$ext"
  fi
done

