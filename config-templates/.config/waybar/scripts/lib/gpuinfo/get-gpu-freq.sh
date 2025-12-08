get_gpu_freq_nvidia() {
    nvidia-smi --query-gpu=clocks.gr --format=csv,noheader,nounits | head -n 1
}

get_gpu_freq_amd() {
    local freq_file="/sys/class/drm/card0/device/pp_dpm_sclk"
    if [ -f "$freq_file" ]; then
        grep '*' "$freq_file" | awk '{print $2}'
    else
        echo "-"
    fi
}

get_gpu_freq_intel() {
    intelgpu_freq_file_path=$HOME/.cache/intelgpu_freq_file_path
    if [ ! -f "$intelgpu_freq_file_path" ]; then
        cat ${$(grep -l "0x8086" /sys/class/drm/card*/device/vendor)%/device*}/gt/gt0/rps_cur_freq_mhz \
            > "$intelgpu_freq_file_path"
    fi

    cat "$intelgpu_freq_file_path"
}