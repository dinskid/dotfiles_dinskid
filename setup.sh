#!/usr/bin/env sh

cd ~/.config

# install
read -p "Do you want to upgrade? (y/n): " up
if [ "$up" = "y" ] | [ "$up" = "Y" ] | [ "$up" = "" ] ; then
  sudo pacman -Syyu
fi
echo

sudo pacman -S --needed git make gcc clang neovim nodejs npm zsh xclip network-manager-applet flameshot powerline-fonts otf-font-awesome light xdotool wmctrl feh awesome-terminal-fonts github-cli fzf zoxide
echo

read -p "Do you want to install the configured aurs? (y/n): " yay
if [ "$yay" = "y" ] | [ "$yay" = "Y" ] | [ "$yay" = "" ] ; then
  yay -S --needed bumblebee-status ulauncher libinput-gestures
else
  echo "Skipping..."
fi
echo

if [ ! -d "$HOME/.oh-my-zsh" ] ; then
  echo "installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "done"
else
  echo "oh-my-zsh installed! skipping..."
fi
if [ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ] ; then
  echo "installing packer for nvim"
  git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  echo "done"
else
  echo "packer installed! skipping..."
fi
echo

read -p "Do you want to set up the configs? (y/n): " cfg
if [ "$cfg" = "y" ] | [ "$cfg" = "Y" ] | [ "$cfg" = "" ] ; then
  echo "setting symlinks"
  # setup links
  ln -sf dotfiles_dinskid/i3
  ln -sf dotfiles_dinskid/nvim
  ln -sf dotfiles_dinskid/kitty
  ln -sf dotfiles_dinskid/xournalpp
  ln -sf dotfiles_dinskid/neofetch
  ln -sf dotfiles_dinskid/libinput-gestures.conf
  ln -sf dotfiles_dinskid/ulauncher

  echo "additional config"
  i3-msg reload
  sudo gpasswd -a $USER input
  sudo chmod +s /usr/bin/light
else
  echo "skipping auto config"
fi
echo

read -p "Do you want to set up git? (y/n): " git
if [ "$git" = "y" ] | [ "$git" = "Y" ] | [ "$git" = "" ] ; then
  git config --global user.name "Dinesh Vikram V"
  git config --global user.email "astrodini@gmail.com"
  # ssh for git
  ssh-keygen -t ed25519 -C "astrodini@gmail.com"
  eval "$(ssh-agent -s)"
  ssh-add -K ~/.ssh/id_ed25519

  cat ~/.ssh/id_ed25519.pub
  read -p "Add public key to github? (y/n): " gh
  if [ "$gh" = "y" ] | [ "$gh" = "Y" ] | [ "$gh" = "" ] ; then
    gh auth refresh -h github.com -s admin:public_key
    read -p "Enter title string for public key: " ts
    gh ssh-key add ~/.ssh/id_ed25519.pub -t $ts
  fi
else
  echo "Skipping git setup..."
fi
