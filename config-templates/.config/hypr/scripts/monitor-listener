#!/bin/bash

SOCK="$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock"

socat -U - UNIX-CONNECT:$SOCK | while read -r line; do
    if echo "$line" | grep -q "monitoradded"; then
        ~/.config/hypr/scripts/monitor-auto.sh
    fi

    if echo "$line" | grep -q "monitorremoved"; then
        ~/.config/hypr/scripts/monitor-auto.sh
    fi
done
