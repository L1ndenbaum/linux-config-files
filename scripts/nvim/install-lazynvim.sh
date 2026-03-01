#!/bin/bash
sudo pacman -S --needed git

git clone https://github.com/folke/lazy.nvim.git \
  ~/.local/share/nvim/lazy/lazy.nvim