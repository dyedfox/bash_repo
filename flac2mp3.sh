#!/bin/bash
# NOTE : Quote it else use array to avoid problems #

#crop image from bottom using jpegtopnm from netpbm-progs package

#Нижче приклад
#ffmpeg -i input.flac -ab 320k -map_metadata 0 -id3v2_version 3 output.mp3

echo 'Input number of pixels to crop:'
read n

FILES="./*.flac"
for f in $FILES
do
  b="$(basename -- $f)"
  echo "$b"
  ff="${b%.*}"
  ffmpeg -i "$b" -ab 320k -map_metadata 0 -id3v2_version 3 "$ff.mp3"

done
