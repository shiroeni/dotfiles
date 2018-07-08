if [ -d "$HOME/.asdf/" ]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
else
  warn "    [x] asdf is not installed"
fi
