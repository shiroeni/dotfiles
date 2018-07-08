# Check and initialize rbenv
if [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - zsh)"
else
  warn " x   [Warning] rbenv is not installed"
fi
