#!/bin/bash

project_root="$(dirname "$0")"
source "$project_root/scripts/lib/sync-utils.sh"

config_list="$project_root/configEntryList"
backup_config_dir="$project_root/backup/.config"
backup_home_dir="$project_root/backup/home"

# 还原 ~/.config 下的目录
while IFS= read -r entry; do
    src="$backup_config_dir/$entry"
    dst="$HOME/.config/$entry"

    if [ -d "$src" ]; then
        echo "Restoring config dir: $entry"
        sync_dir "$src" "$dst"
    fi
done < "$config_list"

# 还原 dotfiles
for dot in ".zshrc" ".vimrc" ".bashrc" ".p10k.zsh"; do
    src="$backup_home_dir/$dot"
    dst="$HOME/$dot"

    if [ -f "$src" ]; then
        echo "Restoring dotfile: $dot"
        sync_file "$src" "$dst"
    fi
done

