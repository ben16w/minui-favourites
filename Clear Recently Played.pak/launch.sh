#!/bin/sh 

DIR=$(dirname "$0")
cd "$DIR"

RECENTS_PATH="/mnt/SDCARD/.userdata/shared/.minui/recent.txt"

if [ ! -s "$RECENTS_PATH" ]; then
    show.elf "$DIR/error.png" 2
    exit 1
fi

rm "$RECENTS_PATH"
touch "$RECENTS_PATH"

show.elf "$DIR/done.png" 2
