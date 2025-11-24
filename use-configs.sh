#!/bin/bash

project_root="$(dirname "$0")"
source "$project_root/scripts/lib/sync-utils.sh"

config_list="$project_root/configEntryList"
config_dir="$project_root/config"

# 覆盖 ~/.config 下的目录
while IFS= read -r entry; do
    src="$config_dir/.config/$entry"
    dst="$HOME/.config/$entry"

    if [ -d "$src" ]; then
        echo "Applying config dir: $entry"
        sync_dir "$src" "$dst"
    fi
done < "$config_list"

# 覆盖 dotfiles
for dot in ".zshrc" ".vimrc" ".bashrc" ".p10k.zsh"; do
    src="$config_dir/$dot"
    dst="$HOME/$dot"
    if [ -f "$src" ]; then
        echo "Applying dotfile: $dot"
        sync_file "$src" "$dst"
    fi
done

