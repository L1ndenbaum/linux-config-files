#!/bin/bash

mkdir -p ~/.config/environment.d

cat <<'EOF' > ~/.config/environment.d/gaming.conf
__GL_SHADER_DISK_CACHE_SIZE=12000000000
EOF