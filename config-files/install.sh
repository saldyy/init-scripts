# /bin/bash


git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
cp ./tmux.conf ~/.tmux.conf
cp ./zshrc ~/.zshrc
cp ./gitconfig ~/.gitconfig
cp ./wezterm.lua ~/.wezterm.lua


# Install Dracula theme for Wezterm
WEZTERM_CONFIG_DIR=~/.config/wezterm/qwer
# Maksure Wezterm config is existed
if [ ! -d $WEZTERM_CONFIG_DIR ]; then
  mkdir -p $WEZTERM_CONFIG_DIR
fi

cp ./wezterm.lua $WEZTERM_CONFIG_DIR/wezterm.lua
cp ./dracula-theme/wezterm/colors.toml $WEZTERM_CONFIG_DIR/colors.toml

source ~/.zshrc


