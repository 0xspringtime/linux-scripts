#!/bin/bash

# Get command name from argument or default to "clipboard-image"
COMMAND=${1:-"clipboard-image"}

# Get image data from clipboard and save to file
xclip -selection clipboard -t image/png -o > clipboard.png

# Create filename based on command name and date (if no command name is provided)
if [ "$COMMAND" = "clipboard-image" ]; then
    FILENAME="${COMMAND}-$(date '+%Y-%m-%d_%H-%M-%S').png"
else
    FILENAME="${COMMAND}.png"
fi

# Copy file to current directory with filename and overwrite if it already exists
cp -f clipboard.png "./${FILENAME}"

# Remove temporary file
rm clipboard.png

