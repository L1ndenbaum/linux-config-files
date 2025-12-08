get_gpu_model_nvidia() {
    nvidia-smi --query-gpu=name --format=csv,noheader | head -n 1
}

get_gpu_model_amd() {
    lspci | grep -i 'VGA.*AMD' | sed 's/.*: //'
}

get_gpu_model_intel() {
    lspci | grep -i 'VGA.*Intel' | sed 's/.*: //'
}