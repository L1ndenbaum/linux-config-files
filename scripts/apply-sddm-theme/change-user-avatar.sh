#!/bin/bash

set -euo pipefail

username="$USERNAME"
avatar_file=$(readlink -f "$2")
if [ -z "$avatar_path" ]
    echo "Do not pass a empty avatar path !"
    return 1
fi
if [ ! -f "$avatar_path" ]
    echo "Avatar file do not exist !"
    return 1
fi

sudo magick "$avatar_file" -resize 256x256 "/tmp/$username.face.icon"
sudo mv "/tmp/$username.face.icon" "/usr/share/sddm/faces/$username.face.icon"