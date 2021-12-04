#!/usr/bin/sh

export EDITOR=nvim

fix() {
  $HOME/run.sh
}

remacs() {
  systemctl restart emacs --user
}

vsc() {
  code $1 . && exit
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

