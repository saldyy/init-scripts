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
    wdisplays \
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

install_hack_nerd_font() {
    # Define local variables
    local URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip"
    local TARGET_DIR="$HOME/.local/share/fonts/"
    local TMP_DIR="/tmp/hack_font_install"

    # 1. Dependency Check
    if ! command -v unzip &> /dev/null || ! command -v curl &> /dev/null; then
        echo "Error: curl and unzip are required. Install them with: sudo dnf install curl unzip"
        return 1
    fi

    echo "--- Initializing Hack Nerd Font Setup ---"

    # 2. Setup environment
    mkdir -p "$TMP_DIR"

    # 3. Download to /tmp
    echo "Downloading to $TMP_DIR..."
    if curl -L "$URL" -o "$TMP_DIR/Hack.zip"; then
        
        # 4. Extract
        echo "Extracting fonts..."
        # Extracting into a subfolder within TMP_DIR to keep things contained
        unzip -o "$TMP_DIR/Hack.zip" -d "$TMP_DIR/extracted"

        # 5. Move only font files to Fedora's local font directory
        echo "Installing to $TARGET_DIR..."
        cp "$TMP_DIR/extracted/"*.[to]tf "$TARGET_DIR/"

        # 6. Update font cache
        echo "Refreshing Fedora font cache..."
        fc-cache -f "$TARGET_DIR"

        echo "--- Installation Successful ---"
    else
        echo "Error: Download failed."
        rm -rf "$TMP_DIR"
        return 1
    fi

    # 7. Cleanup TMP_DIR
    rm -rf "$TMP_DIR"
    echo "Temporary files removed from /tmp."
}

init() {
  # install_packages
  # install_neovim
  # install_zsh
  # install_ghostty
  install_hack_nerd_font
}

init
