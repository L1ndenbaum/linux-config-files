#!/bin/bash

sudo tee /etc/systemd/system/nvidia-lgc-lmc.service >/dev/null <<'EOF'
[Unit]
Description=Set lgc and lmc of nvidia card
ConditionPathExists=/usr/bin/nvidia-smi

[Service]
Type=oneshot
ExecStart=/usr/bin/nvidia-smi -pm 1
ExecStart=/usr/bin/nvidia-smi -lgc 1500,3105
ExecStart=/usr/bin/nvidia-smi -lmc 1500,8001

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable --now nvidia-lgc-lmc
