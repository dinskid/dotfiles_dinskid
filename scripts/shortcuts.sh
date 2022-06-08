#!/usr/bin/sh

export EDITOR=nvim

alias e=nvim
alias vim=nvim
alias vi=nvim

fix() {
  $HOME/run.sh
}

remacs() {
  systemctl restart emacs --user
}

vsc() {
  (gnvim $1 . &)
}

gorand() {
  cd $HOME/cp/rand/$1
}

gocp() {
  cd $HOME/cp/contest/$1
}

cptxt() {
  xclip -sel clipboard -i $1
}

countfiles() {
  find . -type d -print0 | while read -d '' -r dir; do
      files=("$dir"/*)
      printf "%5d files in directory %s\n" "${#files[@]}" "$dir"
  done
}

