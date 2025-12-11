#!/bin/bash
current_script_path="$(readlink -f "$0")"
current_script_dir="$(dirname "$current_script_path")"
scripts_dir="$(dirname "$current_script_dir")"
project_root="$(dirname "$scripts_dir")"

sddm_template_config_file="$project_root/config-templates/etc/sddm.conf"
system_sddm_config_file="/etc/sddm.conf"
sudo rsync -a $sddm_template_config_file $system_sddm_config_file