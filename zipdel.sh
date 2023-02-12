#!/bin/bash

# Check if the user has provided a directory
if [ $# -eq 0 ]
then
    echo "Please provide a directory as an argument."
    exit 1
fi

# Get the directory
directory=$1

# Unzip all zip files in the directory
for archive in "$directory"/*.zip "$directory"/*.7z
do
    if [ "${archive##*.}" = "zip" ]
    then
        unzip "$archive" -d "$directory"
    elif [ "${archive##*.}" = "7z" ]
    then
        7z x "$archive" -o"$directory"
    fi
done

# Delete all zip files in the directory
rm "$directory"/*.zip "$directory"/*.7z
