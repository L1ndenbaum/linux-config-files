#!/bin/bash

config_file="$HOME/.config/waybar/config"

case "$XDG_CURRENT_DESKTOP" in 
    Hyprland)
        echo "Switching waybar wm-modules to Hyprland"
        sed -i "s/niri/hyprland/g" $config_file
        ;;
    niri)
        echo "Switching waybar wm-modules to Niri"
        sed -i "s/hyprland/niri/g" $config_file
        ;;
esac