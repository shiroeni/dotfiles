export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"

export SSH_KEY_PATH="~/.ssh/rsa_id"

source "$HOME/.zshrc.d/functions.zsh"
source "$HOME/.zshrc.d/aliases.zsh"

plugins=(
  git
  ruby
  bundler
  rbenv
  asdf
)

source $ZSH/oh-my-zsh.sh
