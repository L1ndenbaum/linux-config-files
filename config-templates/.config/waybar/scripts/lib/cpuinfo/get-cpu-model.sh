#!/bin/bash

get_cpu_model() {
    local model
    model=$(awk -F ': *' '/model name/ {print $2; exit}' /proc/cpuinfo)
    echo "$model"
}