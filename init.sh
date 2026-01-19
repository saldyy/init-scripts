#!/bin/bash

THEMES_DIR="$(pwd)/themes"

create_dir() {
  if [ ! -d "$1" ]; then
    mkdir -p "$1"
  fi
}

install_packages() {
  # Enable COPR repositories
  dnf copr enable -y dejan/lazygit

  sudo dnf5 update -y

  ## Install basic packages
  sudo dnf5 install -y \
    gimp \
    nautilus \
    vlc \
    openh264 \
    evince \
    obs-studio \
    rofi \
    sway

  # Install system utilities tools
  sudo dnf5 install -y \
    flatpak \
    jq \
    ripgrep \
    fzf \
    tldr \
    openssl \
    nmap \
    htop \
    xrandr \
    lazygit

  ## Install Keyboard packages
  sudo dnf5 install -y \
    fcitx5 \
    fcitx5-configtool \
    fcitx5-qt \
    fcitx5-unikey \

  flatpak install flathub io.github.seadve.Kooha
}

install_neovim() {
  sudo dnf5 install -y neovim

  # Install Vim Plug for Neovim
  curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_zsh() {
  DRACULA_ZSH_THEME_DIR="${THEMES_DIR}/dracula-zsh"

  sudo dnf5 install -y zsh
  chsh -s $(which zsh)
  #
  # Install Zplug
  curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

  # Install zsh-autosuggestions/completions plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions "${HOME}/.zsh/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-completions "${HOME}/.zsh/zsh-completions"
}

install_ghostty() {
  sudo dnf5 copr enable -y scottames/ghostty
  sudo dnf5 install -y ghostty
}

init() {
  install_packages
  install_neovim
  install_zsh
  install_ghostty
}

init
