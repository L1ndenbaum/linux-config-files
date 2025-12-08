packages=(
	mesa xf86-video-intel libva-intel-driver
	vulkan-intel intel-media-driver	
)
	
sudo pacman -S --needed "${packages[@]}"
