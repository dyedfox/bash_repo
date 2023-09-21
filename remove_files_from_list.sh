#!/bin/bash

### In the file bashscript.sh write a shell script that takes a filename as a parameter (input file contains the names of the files to be deleted), 
###reads each line of the file, and deletes the files with the same name


while IFS= read -r line; do
    # Check if the line is a valid file path
    if [ -e "$line" ]; then
    rm "$line"
    fi
done < "$1"