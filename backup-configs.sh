#!/bin/bash

project_root="$(dirname "$0")"
source "$project_root/scripts/lib/sync-utils.sh"

config_list="$project_root/configEntryList"
backup_config_dir="$project_root/backup/.config"
backup_home_dir="$project_root/backup/home"

mkdir -p "$backup_config_dir" "$backup_home_dir"

# 备份 ~/.config 下的目录
while IFS= read -r entry; do
    src="$HOME/.config/$entry"
    dst="$backup_config_dir/$entry"

    if [ -d "$src" ]; then
        echo "Backing up config dir: $entry"
        sync_dir "$src" "$dst"
    fi
done < "$config_list"

# 备份 dotfiles
for dot in ".zshrc" ".vimrc" ".bashrc", ".p10k.zsh"; do
    src="$HOME/$dot"
    dst="$backup_home_dir/$dot"
    if [ -f "$src" ]; then
        echo "Backing up dotfile: $dot"
        sync_file "$src" "$dst"
    fi
done

