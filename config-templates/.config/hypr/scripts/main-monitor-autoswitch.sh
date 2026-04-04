#!/bin/bash

INTERNAL="eDP-1"

MONITORS=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

EXTERNAL_FOUND=0

for m in $MONITORS; do
    if [ "$m" != "$INTERNAL" ]; then
        EXTERNAL_FOUND=1
    fi
done

if [ $EXTERNAL_FOUND -eq 1 ]; then
    # 有外接显示器 -> 关内屏
    hyprctl keyword monitor "$INTERNAL,disable"
else
    # 没外接 -> 开内屏
    hyprctl keyword monitor "$INTERNAL,2560x1600@165,auto,1.6"
fi
