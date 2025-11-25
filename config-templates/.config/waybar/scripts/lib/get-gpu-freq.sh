get_gpu_freq_nvidia() {
    nvidia-smi --query-gpu=clocks.gr --format=csv,noheader,nounits | head -n 1
}

get_gpu_freq_amd() {
    local f="/sys/class/drm/card0/device/pp_dpm_sclk"
    if [ -f "$f" ]; then
        grep '*' "$f" | awk '{print $2}'  # 当前频率（MHz）
    else
        echo "-"
    fi
}

get_gpu_freq_intel() {
    local f="/sys/class/drm/card0/gt/gt0/rps_cur_freq_mhz"
    if [ -f "$f" ]; then
        cat "$f"
    else
        echo "-"
    fi
}