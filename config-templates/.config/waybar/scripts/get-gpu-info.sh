#!/bin/bash

root_dir=$(cd $(dirname "0") && pwd)
source "$root_dir"/lib/get-gpu-vendor.sh
source "$root_dir"/lib/get-gpu-model.sh
source "$root_dir"/lib/get-gpu-temp.sh
source "$root_dir"/lib/get-gpu-freq.sh

gpu_vendor=$(get_gpu_vendor)

case "$gpu_vendor" in
    NVIDIA)
        model=$(get_gpu_model_nvidia)
        temp=$(get_gpu_temp_nvidia)
        freq=$(get_gpu_freq_nvidia)
        ;;
    AMD)
        model=$(get_gpu_model_amd)
        temp=$(get_gpu_temp_amd)
        freq=$(get_gpu_freq_amd)
        ;;
    INTEL)
        model=$(get_gpu_model_intel)
        temp=$(get_gpu_temp_intel)
        freq=$(get_gpu_freq_intel)
        ;;
    *)
        model="Unknown GPU"
        temp="-"
        freq="-"
        ;;
esac

echo "Model: $model"
echo "Temp:  $temp°C"
echo "Freq:  $freq MHz"
