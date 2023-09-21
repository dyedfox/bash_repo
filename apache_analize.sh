#!/bin/bash

# Specify the input log file and output file
input_file="apache_logs"
output_file="not_found.txt"

# Loop through each line in the input log file
while IFS= read -r line; do
    # Use grep to check if the line contains " 404 "
    if echo "$line" | grep -q " 404 "; then
        # Extract IP address, HTTP method, and path
        ip_address=$(echo "$line" | awk '{print $1}')
        request_info=$(echo "$line" | awk -F '"' '{print $2}')
        
        # Append the information to the output file
        echo "$ip_address $request_info" >> "$output_file"
    fi
done < "$input_file"