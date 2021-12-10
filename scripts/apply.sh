#!/usr/bin/sh

echo "source $(pwd)/shortcuts.sh" >> $HOME/.bashrc
echo "source $(pwd)/shortcuts.sh" >> $HOME/.zshrc
echo 'eval "$(zoxide init zsh)"' >> $HOME/.bashrc
echo 'eval "$(zoxide init zsh)"' >> $HOME/.zshrc
