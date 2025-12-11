#!/bin/bash

root_dir=$(cd $(dirname "0") && pwd)
source "$root_dir"/lib/gpuinfo/get-gpu-pci-list.sh
source "$root_dir"/lib/get-gpu-model.sh
source "$root_dir"/lib/get-gpu-temp.sh
source "$root_dir"/lib/get-gpu-freq.sh

mkdir -p "$HOME/.cache/waybar/gpuinfo"
gpu_pci_list_file="$HOME/.cache/waybar/gpuinfo/gpu_pci_list"
current_displayed_gpu_idx_file="$HOME/.cache/waybar/gpuinfo/current_displayed_gpu_idx"

if [ ! -f $gpu_pci_list_file ]
    echo $(get_gpu_pci_list) > $gpu_pci_list_file
fi

if [ ! -f $current_displayed_gpu_idx_file ]
    echo "0" > $current_displayed_gpu_idx_file
fi

gpu_pci=$(sed -n "$(( $(cat "$current_displayed_gpu_idx_file") +1))p" "$gpu_pci_list_file")

