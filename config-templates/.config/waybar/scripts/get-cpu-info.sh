#!/bin/bash

root_dir="$(cd "$(dirname "$0")" && pwd)"
source $root_dir/lib/get-cpu-freq.sh
source $root_dir/lib/get-cpu-model.sh
source $root_dir/lib/get-cpu-temp.sh

STATE_FILE="$HOME/.cache/waybar-cpuinfo-mode"
if [[ ! -f "$STATE_FILE" ]]; then
    echo "temp" > "$STATE_FILE"
fi
current_state=$(cat "$STATE_FILE")

model=" $(get_cpu_model)"
case "$current_state" in
    freq)
        freqs="$(get_cpu_freq)"
        text=$(echo "$freqs" | head -n 1)
        tooltip=$(printf "%s\n%s" "$model" "$freqs")
        ;;
    temp)
        temps="$(parse_cpu_hwmon $(find_cpu_hwmon))"
        text=$(echo "$temps" | head -n 1)
        tooltip=$(printf "%s\n%s" "$model" "$temps")
        ;;
esac

jq --unbuffered --compact-output -n \
    --arg text "$text" \
    --arg tooltip "$tooltip" \
    '{text: $text, tooltip: $tooltip}'