#!/bin/bash

if ! command -v mako > /dev/null 2>&1; then
    echo "Mako is not installed. Installing..."
    sudo pacman -S mako --noconfirm
else
    echo "Mako is already installed. Configure File will be editted"
fi

MAKO_DIR="$HOME/.config/mako"
if [ ! -d "$MAKO_DIR" ]; then 
    mkdir -p "$MAKO_DIR"
    touch "$MAKO_DIR/config"
fi

cat <<EOF > "$MAKO_DIR/config"
default-timeout=5000
border-radius=5
EOF

makoctl reload
