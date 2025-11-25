#!/bin/bash

gpu_manufacturer=~/.cache/gpu_manufacturer

if [ ! -f "$gpu_manufacturer" ]; then
    if command -v nvidia-smi &>/dev/null; then
        echo "NVIDIA" > "$gpu_manufacturer"
    elif ls /sys/class/hwmon/*/name | xargs cat | grep -qi amdgpu; then
        echo "AMD" > "$gpu_manufacturer"
    elif lspci | grep -qi "Iris Xe"; then
        echo "INTEL" > "$gpu_manufacturer"
    else
        echo "UNKNOWN" > "$gpu_manufacturer"
    fi
fi

gpu=$(cat "$gpu_manufacturer")

case "$gpu" in
    NVIDIA)
        echo $(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | head -n 1)
        ;;
    AMD)
        file=$(grep -l amdgpu /sys/class/hwmon/*/name | sed 's/name$/temp1_input/')
        echo $(( $(cat "$file") / 1000 ))
        ;;
    INTEL)
        # iGPU 没有专用 GPU 温度 sensor，只能 approximated 来自 CPU pkg
        file=$(grep -l x86_pkg_temp /sys/class/thermal/thermal_zone*/type | sed 's/type$/temp/')
        echo $(( $(cat "$file") / 1000 ))
        ;;
    *)
        echo "-"
        ;;
esac
