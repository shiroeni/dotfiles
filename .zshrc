export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="bira"

export SSH_KEY_PATH="~/.ssh/rsa_id"

plugins=(
  git
  ruby
  bundler
  rbenv
  asdf
)

source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias rake="bundle exec rake"
alias rails="bundle exec rails"
alias rack="bundle exec rack"
alias karafka="bundle exec karafka"
alias racecar="bundle exec racecar"
alias cap="bundle exec cap"

# uncomment for WSL with external X Server
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
# export LIBGL_ALWAYS_INDIRECT=1
