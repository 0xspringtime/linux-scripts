#!/bin/bash

# get the folder path from the first argument
folder=$1

# loop through all files in the folder
for file in "$folder"/*
do
  # check if the file is a video file (mp4 or mkv)
  if [[ $file == *.mp4 || $file == *.mkv ]]
  then
    # get the filename without the extension
    filename=$(basename "$file" .mp4)
    filename=$(basename "$filename" .mkv)

    # construct the name of the subtitle file
    subtitle="$folder/$filename.srt"

    # check if the subtitle file exists
    if [ -f "$subtitle" ]
    then
      # run the alass command
      alass-cli "$file" "$subtitle" "$folder/$filename.output.srt"
    fi
  fi
done

