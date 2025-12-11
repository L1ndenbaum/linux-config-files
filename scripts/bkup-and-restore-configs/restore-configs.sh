#!/bin/bash

# 用backup中的文件替换现在系统中的文件
current_script_path="$(readlink -f "$0")"
current_script_dir="$(dirname "$current_script_path")"
scripts_dir="$(dirname "$current_script_dir")"
project_root="$(dirname "$scripts_dir")"

source "$scripts_dir/lib/sync-utils.sh"

config_list="$project_root/config-entry-list"
home_dotfile_list="$project_root/home-dotfile-entry-list"
backup_config_dir="$project_root/backup/.config"
backup_home_dir="$project_root/backup/home"

# 还原 ~/.config 下的目录
while IFS= read -r entry; do
    # 跳过空行或以 # 开头
    if [[ -z "$entry" || "$entry" == \#* ]]; then
        continue
    fi

    src="$backup_config_dir/$entry"
    dst="$HOME/.config/$entry"

    if [ -d "$src" ]; then
        echo "Restoring config dir: $src"
        sync_dir "$src" "$dst"
    fi
done < "$config_list"

# 还原 dotfiles
while IFS= read -r dotfile; do
    if [[ -z "$dotfile" || "$dotfile" == \#* ]]; then
        continue
    fi

    src="$backup_home_dir/$dotfile"
    dst="$HOME/$dotfile"

    if [ -f "$src" ]; then
        echo "Restoring dotfile: $src"
        sync_file "$src" "$dst"
    fi
done < "$home_dotfile_list"