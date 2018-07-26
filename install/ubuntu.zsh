USERSPACE_PACKAGES=(
    "i3-wm"
    "i3blocks"
    "suckless-tools"
    "emacs"
    "vim"
    "thunar"
    "shutter"
    "git"
    "curl"
    "wget"
    "zsh"
    "build-essential"
    "lightdm"
    "lightdm-gtk-greeter"
    "tilix"
)

RUBY_DEPENDENCIES=(
    "git-core"
    "zlib1g-dev"
    "libssl-dev"
    "libreadline-dev"
    "libyaml-dev"
    "libsqlite3-dev"
    "sqlite3"
    "libxml2-dev"
    "libxslt1-dev"
    "libcurl4-openssl-dev"
    "libffi-dev"
)

# Packages from ppas
EXTERNAL_PACKAGES=(
    "nodejs"
    "yarn"
    "emacs26"
    "neovim"
)

DISTRO=$(lsb_release -c -s)

# Install keys
curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | sudo apt-key add -
curl -s https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

# nodejs repository
echo "deb https://deb.nodesource.com/node_10.x ${DISTRO} main" | sudo tee /etc/apt/sources.list.d/nodesource.list

# yarn repository
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# emacs
echo "deb http://ppa.launchpad.net/kelleyk/emacs/ubuntu ${DISTRO} main" | sudo tee /etc/apt/sources.list.d/kelleyk-ubuntu-emacs.list

# neovim
echo "deb http://ppa.launchpad.net/neovim-ppa/stable/ubuntu ${DISTRO} main" | sudo tee /etc/api/sources.list.d/neovim-ppa.list

sudo apt install $USERSPACE_PACKAGES $RUBY_DEPENDENCIES $EXTERNAL_PACKAGES
