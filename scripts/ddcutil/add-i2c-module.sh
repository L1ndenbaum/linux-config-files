#!/bin/bash

sudo tee /etc/modules-load.d/i2c-dev.conf <<EOF
i2c-dev
EOF