#!/bin/bash
set -euo pipefail

# 用作者的 config 文件替换你的
project_root="$(cd "$(dirname "$0")" && pwd)"
source "$project_root/scripts/lib/sync-utils.sh"

config_list="$project_root/config-entry-list"
home_dotfile_list="$project_root/home-dotfile-entry-list"
config_dir="$project_root/config-templates"
config_home_dir="$project_root/config-templates/home"

#备份当前系统的config文件到 $project_dir/backup
"$project_root/scripts/bkup-and-restore-configs/backup-current-configs.sh"

# 覆盖 ~/.config 下的目录
while IFS= read -r entry; do
    src="$config_dir/.config/$entry"
    dst="$HOME/.config/$entry"

    if [ -d "$src" ]; then
        echo "Applying config dir: $src"
        sync_dir "$src" "$dst"
    fi
done < "$config_list"

while IFS= read -r dotfile; do
    if [[ -z "$dotfile" || "$dotfile" == \#* ]]; then
        continue
    fi

    src="$config_home_dir/$dotfile"
    dst="$HOME/$dotfile"

    if [ -f "$src" ]; then
        echo "Applying dotfile: $src"
        sync_file "$src" "$dst"
    fi
done < "$home_dotfile_list"

# 把waybar的wm相关模块调整为当前的$XDG_CURRENT_DESKTOP对应的wm
if grep -qi "waybar" "$config_list"; then
    "$project_root/scripts/waybar/toggle-waybar-modules-wm-field.sh"
fi

# read -r -p "给当前用户添加一个头像 -> [y/n]?" use_avatar
# case $use_avatar in
#     [Yy])

#         ;;
#     [Nn])

#         ;;
# esac