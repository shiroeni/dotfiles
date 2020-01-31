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

alias rake="bundle exec rake"
alias rails="bundle exec rails"
alias rack="bundle exec rack"
alias karafka="bundle exec karafka"
alias racecar="bundle exec racecar"
alias cap="bundle exec cap"
