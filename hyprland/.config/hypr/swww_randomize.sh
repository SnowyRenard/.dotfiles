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
INTERVAL="$2"

while true; do
	if ! pgrep -x "steam" > /dev/null # disable update if steam is enabled
	then
		find "$1" \ # find an image in current directory
			| while read -r img; do
				echo "$((RANDOM % 1000)):$img" # select random image
		done \
			| sort -n | cut -d':' -f2- \
			| while read -r img; do
	
				killall waybar & 
				
				magick "$img" -gravity Center -extent 1.005:1 ~/.cache/rofi.bmp & # generate image for rofi
	
				swww img "$img" & # change background
	
				wallust run "$img" --quiet -d ~/.config/wallust/ # generate all the colors
	
				waybar &
	
				sleep $INTERVAL
			done
	fi
done
