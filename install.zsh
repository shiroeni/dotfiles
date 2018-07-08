if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$NAME
  VER=$VERSION_ID
elif type lsb_release >/dev/nill 2>&1; then
  OS=$(lsb_release -si)
  VER=$(lsb_release -sr)
fi

if [ OS = "Arch Linux" ]; then
  sudo pacman -Sy base-devel nodejs yarn npm
elif [ OS = "Ubuntu" ]; then
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

  sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev nodejs yarn
fi

# Install rbenv and ruby-build
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install asdf with erlang and elixir plugins
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.0
~/.asdf/bin/asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
~/.asdf/bin/asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

cp -r ./dotzsh/zshrc.d ~/.zshrc.d
cp ./dotzsh/zshrc ~/.zshrc

cp -r ./nvim ~/.config/nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
