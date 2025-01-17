#!/bin/sh

DIR="$(dirname "$0")"
cd "$DIR"

COLLECTIONS_PATH="/mnt/SDCARD/Collections"
RECENTS_PATH="/mnt/SDCARD/.userdata/shared/.minui/recent.txt"
FAVORITES_PATH="$COLLECTIONS_PATH/1) Favorites.txt"

if [ ! -s "$RECENTS_PATH" ]; then
  show.elf "$DIR/failed.png" 5
  exit 1
fi

MOST_RECENT_GAME=$(head -n 1 "$RECENTS_PATH" | cut -f1)

if [ ! -s "$FAVORITES_PATH" ]; then
  show.elf "$DIR/failed.png" 5
  exit 1
fi

if grep -Fxq "$MOST_RECENT_GAME" "$FAVORITES_PATH"; then
  grep -Fxv "$MOST_RECENT_GAME" "$FAVORITES_PATH" > "$FAVORITES_PATH.tmp"
  mv "$FAVORITES_PATH.tmp" "$FAVORITES_PATH"
fi

if [ ! -s "$FAVORITES_PATH" ]; then
  rm -f "$FAVORITES_PATH"
fi

show.elf "$DIR/success.png" 5