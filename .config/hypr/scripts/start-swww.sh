#! /bin/bash

#check for WALLPAPER_DIR

if [ -z "$WALLPAPER_DIR" ]; then
    #using default hyprland wallpaper directory
    export WALLPAPER_DIR="/usr/share/hyprland/"
fi

if [ -z "$(pidof swww-daemon)" ]; then
    swww init
fi

#check for image cache
image=$(swww query | grep -oP '(?<=image: ).*')
if [ -z "$image" ]; then
    swww img $HOME/wal.jpg
fi
image=$(swww query | grep -oP '(?<=image: ).*')

# building pywal cache
#
# important step
# waybar would killitself without it......

wal --backend haishoku --cols16 -s -n -q -i "$image"
