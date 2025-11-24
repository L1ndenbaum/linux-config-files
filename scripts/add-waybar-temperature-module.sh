#!/bin/bash

cpu_hwmon=$(for d in /sys/class/hwmon/hwmon*; do
    name=$(cat "$d/name" 2>/dev/null)
    case "$name" in
        coretemp|k10temp) echo "$d";;
    esac
done | head -n 1)

cpu_temp_file=$(ls "$cpu_hwmon"/temp*_input | head -n 1)

cat <<EOF > $HOME/.config/waybar/modules/temperature.jsonc
{
    "temperature#cpu": {
        "thermal-zone": 0,
        "hwmon-path": "$cpu_temp_file",
        "critical-threshold": 80,
        "format-critical": " {temperatureC}°C",
        "format": " {temperatureC}°C"
    },

    "temperature#gpu": {
        "thermal-zone": 2,
        "hwmon-path": "/sys/class/hwmon/hwmon7/temp1_input",
        "critical-threshold": 80,
        "format-critical": " {temperatureC}°C",
        "format": " {temperatureC}°C"
    }
}
EOF