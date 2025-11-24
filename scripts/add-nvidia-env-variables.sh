#!/bin/bash

cat <<EOF >> $HOME/.config/hypr/envvariables.conf

env = LIBVA_DRIVER_NAME,nvidia
EOF
