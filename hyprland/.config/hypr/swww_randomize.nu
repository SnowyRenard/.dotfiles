#!/bin/nu
#
# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals

def main [dir, time: int] {
  loop {
    let file = (select_file $dir) 

    update_colors ($file.name | get 0 )
    
    sleep ($time | into duration --unit sec) # Because the input is currently an integer conversion is required
  }
}

# Update the environment based upon the path to an image
def update_colors [img: string] {  
  do {
    killall waybar | ignore

    wallust run $img --quiet -s -d ~/.config/wallust

	  magick $img -gravity Center -extent 1.005:1 ~/.cache/rofi.bmp 

	  swww img $img 

	  ~/.config/nushell/launch waybar
  }
}

# Select a random file within a directory
def select_file [dir] {
  
  let input_dir = ($"($dir)/**/*" | into glob) # glob is required to format because magic?

  let files = ls $input_dir | where type == file # Get all the eligible files

  let index = random int ..($files | length) # Select a random number

  $files | select $index # Return the actual file
}

