#!/bin/bash

STATE_FILE="$HOME/.cache/waybar/cpuinfo/cpuinfo-display_state"
if [[ ! -f "$STATE_FILE" ]]; then
    echo "temp" > "$STATE_FILE"
fi
current_state=$(cat "$STATE_FILE")

case "$current_state" in 
    freq)
        echo "temp" > "$STATE_FILE"
        ;;
    temp)
        echo "freq" > "$STATE_FILE"
        ;;
esac