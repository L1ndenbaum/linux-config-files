#!/bin/bash

# 备份运行 install.sh 的用户的  ~/.config 和 ～/. 文件
current_script_path="$(readlink -f "$0")"
current_script_dir="$(dirname "$current_script_path")"
scripts_dir="$(dirname "$current_script_dir")"
project_root="$(dirname "$scripts_dir")"

source "$scripts_dir/lib/sync-utils.sh"

config_list="$project_root/config-entry-list"
home_dotfile_list="$project_root/home-dotfile-entry-list"
backup_config_dir="$project_root/backup/.config"
backup_home_dir="$project_root/backup/home"

mkdir -p "$backup_config_dir" "$backup_home_dir"

# 备份 ~/.config 下的目录
while IFS= read -r entry; do
    # 跳过空行或以 # 开头
    if [[ -z "$entry" || "$entry" == \#* ]]; then
        continue
    fi

    src="$HOME/.config/$entry"
    dst="$backup_config_dir/$entry"

    if [ -d "$src" ]; then
        echo "Backing up config dir: $src"
        sync_dir "$src" "$dst"
    fi
done < "$config_list"

# 备份 dotfiles
while IFS= read -r dotfile; do
    if [[ -z "$dotfile" || "$dotfile" == \#* ]]; then
        continue
    fi

    src="$HOME/$dotfile"
    dst="$backup_home_dir/$dotfile"

    if [ -f "$src" ]; then
        echo "Backing up dotfile: $src"
        sync_file "$src" "$dst"
    fi
done < "$home_dotfile_list"