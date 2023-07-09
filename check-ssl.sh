#!/bin/bash

# Write a script that checks the use of the https protocol in a URL and return this URL or Error when is false

if [[ $(echo $1 | awk -F '://' '{print $1}') = "https" ]]
then
    echo "$1"
else
  echo "Error!"
fi
