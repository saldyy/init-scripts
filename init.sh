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
    sway \


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

  # ## Insall deaandencies packages
  # sudo dnf5 install -y \
  #   gcc \
  #   meson \
  #   ninja-build \
  #   wayland-devel \
  #   mesa-libEGL-devel \
  #   mesa-libGLES-devel \
  #   mesa-dri-drivers \
  #   xorg-x11-server-Xwayland \
  #   libdrm-devel \
  #   libgbm-devel \
  #   libxkbcommon-devel \
  #   libudev-devel \
  #   pixman-devel \
  #   libinput-devel \
  #   libevdev-devel \
  #   systemd-devel \
  #   cairo-devel \
  #   libpcap-devel \
  #   json-c-devel \
  #   pam-devel \
  #   pango-devel \
  #   pcre-devel \
  #   gdk-pixbuf2-devel \
  #   hwdata-devel

  flatpak install flathub io.github.seadve.Kooha

}

install_neovim() {
  sudo dnf5 install -y neovim

  # Install Vim Plug for Neovim
  curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

install_zsh() {
  KEEP_ZSHRC="yes"
  DRACULA_ZSH_THEME_DIR="${THEMES_DIR}/dracula-zsh"

  sudo dnf5 install -y zsh
  sudo chsh -s $(which zsh)
  # Install Oh My Zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Install zsh-autosuggestions/completions plugins
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH}/custom/plugins/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-completions "${ZSH}/custom/plugins/zsh-completions"

  # Copy Dracula theme
  create_dir $THEMES_DIR

  rm -rf $DRACULA_ZSH_THEME_DIR
  git clone https://github.com/dracula/zsh.git $DRACULA_ZSH_THEME_DIR
  ln -fs $DRACULA_ZSH_THEME_DIR/dracula.zsh-theme "${ZSH}/themes"
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
