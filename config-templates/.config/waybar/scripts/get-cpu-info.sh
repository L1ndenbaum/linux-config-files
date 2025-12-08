#!/bin/bash

root_dir="$(cd "$(dirname "$0")" && pwd)"
source $root_dir/lib/cpuinfo/get-cpu-freq.sh
source $root_dir/lib/cpuinfo/get-cpu-model.sh
source $root_dir/lib/cpuinfo/get-cpu-temp.sh

mkdir -p $HOME/.cache/waybar/cpuinfo
STATE_FILE="$HOME/.cache/waybar/cpuinfo/cpuinfo-display_state"
CPU_MODEL_FILE="$HOME/.cache/waybar/cpuinfo/cpu-model"
if [[ ! -f "$STATE_FILE" ]]; then
    echo "temp" > "$STATE_FILE"
fi
if [[ ! -f "$CPU_MODEL_FILE" ]]; then
    echo $(get_cpu_model) > "$CPU_MODEL_FILE"
fi
current_state=$(cat "$STATE_FILE")
cpu_model=$(cat "$CPU_MODEL_FILE")

case "$current_state" in
    freq)
        model="${cpu_model}"
        freqs="$(get_cpu_freq)"
        text=$(echo "$freqs" | head -n 1)
        tooltip=$(printf "%s\n%s" "$model" "$freqs")
        ;;
    temp)
        model="${cpu_model}"
        temps="$(parse_cpu_hwmon $(find_cpu_hwmon))"
        text=$(echo "$temps" | head -n 1)
        tooltip=$(printf "%s\n%s" "$model" "$temps")
        ;;
esac

jq --unbuffered --compact-output -n \
    --arg text "$text" \
    --arg tooltip "$tooltip" \
    '{text: $text, tooltip: $tooltip}'