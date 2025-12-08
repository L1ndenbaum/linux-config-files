pacman_packages=(
	yay wofi wlogout waypaper libnotify mako dolpin
	wqy-zenhei awesome-terminal-fonts
	qt5-wayland qt6-wayland 
	fcitx5 fcitx5-configtool fcitx5-rime fcitx5-gtk fcitx5-qt fcitx5-chinese-addons
	networkmanager network-manager-applet blueman bluez 
	pipewire wireplumber pipewire-pulse pipewire-alsa pipewire-jack
)

aur_packages=(
	clash-verge-rev-bin visual-studio-code-bin waybar-cava
	ttf-font-awesome-5
	intellij-idea-community-edition
)

sudo pacman -S --needed "${pacman_packages[@]}"
yay -S --needed "${aur_packages[@]}"