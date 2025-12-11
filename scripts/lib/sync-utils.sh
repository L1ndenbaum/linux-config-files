#!/bin/bash

sync_dir() {
    local src="$1"
    local dst="$2"

    mkdir -p "$dst"
    rsync -a --delete "$src/" "$dst/"
}

sync_file() {
    local src="$1"
    local dst="$2"

    mkdir -p "$(dirname "$dst")"
    rsync -a "$src" "$dst"
}

