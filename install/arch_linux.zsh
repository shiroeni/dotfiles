INSTALL_PACKAGES=(
    "i3wm"
    "tmux"
    "tilix"
    "zsh"
    "base-devel"
    "nodejs"
    "yarn"
    "lightdm"
    "lightdm-gtk-greeter"
    "shutter"
    "thunar"
    "emacs"
    "nvim"
    "pulseaudio"
    "ponymix"
    "mpv"
    "ffmpeg"
    "mc"
)

sudo pacman -Sy $INSTALL_PACKAGES
