pacman_packages=(
	yay sddm waybar wofi wlogout waypaper libnotify mako imagemagic
	wqy-zenhei awesome-terminal-fonts
	qt5-wayland qt6-wayland 
	fcitx5 fcitx5-configtool fcitx5-rime fcitx5-gtk fcitx5-qt fcitx5-chinese-addons
	networkmanager network-manager-applet blueman bluez 
	pipewire wireplumber pipewire-pulse pipewire-alsa pipewire-jack
    thunar tumbler ffmpegthumbnailer poppler-glib librsvg
	udisks2 gvfs gvfs-mtp ntfs-3g
)

aur_packages=(
	clash-verge-rev-bin visual-studio-code-bin sddm-silent-theme
	ttf-font-awesome-5
	intellij-idea-community-edition
)

sudo pacman -S --needed "${pacman_packages[@]}"
yay -S --needed "${aur_packages[@]}"