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
for zipfile in "$directory"/*.zip
do
    unzip "$zipfile" -d "$directory"
done

# Delete all zip files in the directory
rm "$directory"/*.zip

