#!/bin/bash

get_cpu_freq() {
    local range=$(cat /sys/devices/system/cpu/present)
    local core_start_idx=${range%-*}
    local core_end_idx=${range#*-}
    local core_freqs=()
    for ((core_idx=core_start_idx; core_idx<=core_end_idx; core_idx++)); do
        local core_freq="/sys/devices/system/cpu/cpu${core_idx}/cpufreq/scaling_cur_freq"

        if [ -f "$core_freq" ]; then
            local khz_freq=$(cat "$core_freq")
            local mhz_freq=$((khz_freq/1000))
            core_freqs+=("Core ${core_idx}: ${mhz_freq}MHZ")
        fi
    done

    for ((i=0; i<${#core_freqs[@]}; i++)); do
        echo " ${core_freqs[$i]}"
    done
}