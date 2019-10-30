# Install oh my zsh
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "~/.oh-my-zsh"

if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]; then
  printf "${YELLOW}Found ~/.zshrc.${NORMAL} ${GREEN}Backing up to ~/.zshrc.pre-oh-my-zsh${NORMAL}\n";
  mv ~/.zshrc ~/.zshrc.pre-oh-my-zsh;
fi

# Install rbenv and ruby-build
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Install asdf with erlang, elixir and nodejs plugins
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.4
~/.asdf/bin/asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
~/.asdf/bin/asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
~/.asdf/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git

# Verify keys for node.js
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring

cp -r ./.zshrc ~/.zshrc
# cp -r ./.tmux.conf ~/.tmux.conf
cp -r ./.config/compton.conf ~/.config/compton.conf
cp -r ./.gemrc ~/.gemrc
cp -r ./.global_ignore ~/.gitignore_global
cp -r ./.reek.yml ~/.reek.yml
cp -r ./.rubocop.yml ~/.rubocop.yml
cp -r ./.spacemacs ~/.spacemacs
