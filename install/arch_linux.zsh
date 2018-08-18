INSTALL_PACKAGES=(
    "i3"
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
    "neovim"
    "git"
)

sudo pacman -Sy $INSTALL_PACKAGES
