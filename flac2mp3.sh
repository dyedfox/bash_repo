#!/bin/bash

# Batch conversion script: Converts all .flac files in the current directory to .mp3 format.
# Requires ffmpeg to be installed.

#Example
#ffmpeg -i input.flac -ab 320k -map_metadata 0 -id3v2_version 3 output.mp3

# # Initial
# for file in *.flac  # Specify file extensions to convert
# do
#     base="$(basename -- "$file")"
#     full_filename="${base%.*}"
#     ffmpeg -i "$file" -ab 320k -map_metadata 0 -id3v2_version 3 "$full_filename.mp3"
# done

for file in *.flac; do
    # Check if there are any .flac files in the directory
    if [ ! -e "$file" ]; then
        echo "No .flac files found in the current directory."
        exit 1
    fi

    # Extract base filename (without extension)
    base="$(basename -- "$file")"
    full_filename="${base%.*}"
    
    # Convert to .mp3 with specified settings
    echo "Converting '$file' to '$full_filename.mp3'..."
    ffmpeg -i "$file" -ab 320k -map_metadata 0 -id3v2_version 3 "${full_filename}.mp3" -y
    
    # Check for success
    if [ $? -eq 0 ]; then
        echo "Conversion successful: '$full_filename.mp3'."
    else
        echo "Error converting '$file'."
    fi
done
