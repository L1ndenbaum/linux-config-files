#!/usr/bin/env bash
set -euo pipefail

CONF="$HOME/.config/hypr/hyprpaper.conf"

# 取当前壁纸（最后一个 wallpaper= 字段）
CURRENT_WALL=$(awk -F',' '/^wallpaper/{print $2}' "$CONF" | tail -n 1)

if [[ -z "${CURRENT_WALL}" ]]; then
  echo "Cannot find current wallpaper in $CONF" >&2
  exit 1
fi

matugen image "$CURRENT_WALL"

# 注意：不需要在这里 reload waybar/hyprland，
# 因为 config.toml 里已经在每个 template 的 post_hook 自动 reload 了。

