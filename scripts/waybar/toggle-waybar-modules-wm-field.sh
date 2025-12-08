#!/bin/bash

modules_files=(
    "$HOME/.config/waybar/modules/window.jsonc"
    "$HOME/.config/waybar/modules/workspaces.jsonc"
)

if pidof -x niri >/dev/null 2>&1; then
    wm="niri"
elif pidof -x hyprland >/dev/null 2>&1; then
    wm="hyprland"
fi

echo $wm

for module_file in $module_files; do 
    case "$wm" in
        niri)
            echo "Switching necessary waybar modules to niri"
            sed -i 's/hyprland/niri/g' $module_file
            ;;
        hyprland)
            echo "Switching necessary waybar modules to hyprland"
            sed -i 's/niri/hyprland/g' $module_file
            ;;
    esac
done