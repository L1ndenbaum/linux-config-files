get_gpu_vendor() {
    local gpu_vendor_cache="$HOME/.cache/gpu_vendor"
    if [ -f "$cache" ]; then
        cat "$cache"
        return
    fi

    if command -v nvidia-smi &>/dev/null; then
        echo "NVIDIA" > "$cache"
    elif lspci | grep -qi "AMD.*Graphics" || lspci | grep -qi "Radeon"; then
        echo "AMD" > "$cache"
    elif lspci | grep -qi "Intel Corporation.*Graphics"; then
        echo "INTEL" > "$cache"
    else
        echo "UNKNOWN" > "$cache"
    fi

    cat "$cache"
}