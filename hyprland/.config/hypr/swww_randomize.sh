#!/bin/bash
#
# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals

if [[ $# -lt 1 ]] || [[ ! -d $1 ]]; then
	echo "Usage:
	$0 <dir containing images>"
	exit 1
fi

# This controls (in seconds) when to switch to the next image
INTERVAL=300

while true; do
	find "$1" \
		| while read -r img; do
			echo "$((RANDOM % 1000)):$img"
	done \
		| sort -n | cut -d':' -f2- \
		| while read -r img; do

			killall waybar &
			
			magick "$img" -gravity Center -extent 1.005:1 ~/.cache/rofi.bmp &

			swww img "$img" &

			wallust run "$img" --quiet -d ~/.config/wallust/

			waybar

			sleep $INTERVAL
		done
	done
