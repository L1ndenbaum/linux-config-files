get_gpu_temp_nvidia() {
    nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader,nounits | head -n 1
}

get_gpu_temp_amd() {
    local d
    amdgpu_hwmon=$(grep -l amdgpu /sys/class/hwmon/*/name | head -n 1)
    if [ -n "$d" ]; then
        amdgpu_hwmon=${amdgpu_hwmon%/name}
        local temp_kdegree=$(cat "$amdgpu_hwmon/temp1_input")
        echo $((temp_kdegree / 1000))
    else
        echo "-"
    fi
}

get_gpu_temp_intel() {
    local f=$(grep -l x86_pkg_temp /sys/class/thermal/thermal_zone*/type 2>/dev/null | sed 's/type$/temp/' | head -n 1)
    if [ -n "$f" ]; then
        echo $(( $(cat "$f") / 1000 ))
    else
        echo "-"
    fi
}