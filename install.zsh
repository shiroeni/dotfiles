if [ -f /etc/os-release ]; then
  . /etc/os-release
  OS=$NAME
  VER=$VERSION_ID
elif type lsb_release >/dev/nill 2>&1; then
  OS=$(lsb_release -si)
  VER=$(lsb_release -sr)
fi

if [ OS = "Arch Linux" ]; then
  source ./install/arch_linux.zsh
elif [ OS = "Ubuntu" ]; then
  source ./install/ubuntu.zsh
fi

# Install oh my zsh
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "~/.oh-my-zsh"

if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  printf "${YELLOW}Found ~/.zshrc.${NORMAL} ${GREEN}Backing up to ~/.zshrc.pre-oh-my-zsh${NORMAL}\n";
  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
fi

mv ./.zshrc ~/.zshrc
mv ./.zshrc.d ~/.zshrc.d

# Install rbenv and ruby-build
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install asdf with erlang, elixir and nodejs plugins
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.0
~/.asdf/bin/asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
~/.asdf/bin/asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
~/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# Verify keys for node.js
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

cp -r ./dotzsh/zshrc.d ~/.zshrc.d
cp ./dotzsh/zshrc ~/.zshrc

cp -r ./.config/nvim ~/.config/nvim

# Install plug.vim for neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp -r ./.tmux.conf ~/.tmux.conf
cp -r ./.config/compton.conf ~/.config/compton.conf
cp -r ./.bundler ~/.bundle
cp -r ./.gemrc ~/.gemrc
cp -r ./.global_ignore ~/.gitignore_global
