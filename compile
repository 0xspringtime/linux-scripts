#!/bin/bash

# Check if the file exists
if [ ! -f $1 ]; then
    echo "File not found!"
    exit 1
fi

# Extract the filename without the .c extension
filename=$(basename -- "$1")
extension="${filename##*.}"
filename="${filename%.*}"

# Compile the C program with gcc
gcc -O3 -o $filename $1

# If compilation is successful, run the program
if [ $? -eq 0 ]; then
    ./$filename
else
    echo "Compilation failed!"
    exit 1
fi
