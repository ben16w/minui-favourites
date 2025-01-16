#!/bin/sh

DIR="$(dirname "$0")"
cd "$DIR"

RECENTS_PATH="/mnt/SDCARD/.userdata/shared/.minui/recent.txt"

if [ ! -s "$RECENTS_PATH" ]; then
    show.elf "$DIR/failed.png" 5
    exit 1
fi

tail -n +2 "$RECENTS_PATH" > "$RECENTS_PATH.tmp"
mv "$RECENTS_PATH.tmp" "$RECENTS_PATH"

show.elf "$DIR/success.png" 5