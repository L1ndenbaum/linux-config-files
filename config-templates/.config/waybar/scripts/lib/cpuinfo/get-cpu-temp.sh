#!/bin/bash

find_cpu_hwmon() {
    for hwmon in /sys/class/hwmon/hwmon*; do
        local name=$(cat "$hwmon/name" 2>/dev/null)
        case "$name" in
            coretemp|k10temp)
                echo "$hwmon"
                return
                ;;
        esac
    done

    # 找不到返回错误码, 后面fallback
    return 1
}

parse_cpu_hwmon() {
    local hwmon_path="$1"
    local labels=()
    local temps=()
    for label_file in "$hwmon_path"/temp*_label; do
        [ -f "$label_file" ] || continue
        base=${label_file%_label}
        input_file="${base}_input"
        temp_kdegree=$(cat "$input_file")
        label=$(cat "$label_file")
        temps+=($(echo "$((temp_kdegree/1000))℃"))
        labels+=("$label")
    done

    for ((i=0; i<${#labels[@]}; i++)); do
        echo "  ${labels[$i]}: ${temps[$i]}"
    done
}