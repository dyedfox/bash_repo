#!/bin/bash

while IFS= read -r line; do
    # Check if the line is a valid file path
    if [ -e "$line" ]; then
         permissions=$(stat -c "%a" "$line")
        echo "$line;$permissions"
    else
        echo "$line;not exists"
    fi
done < "$1"