#!/bin/bash


echo "ho"

rm -rf ~/.zshrc
ln -fs $(pwd)/config-files/zshrc ~/.zshrc

rm -rf ~/.tmux.conf
ln -fs $(pwd)/config-files/tmux.conf ~/.tmux.conf

rm -rf ~/.gitconfig
ln -fs $(pwd)/config-files/gitconfig ~/.gitconfig

rm -rf ~/.config/nvim
ln -fs $(pwd)/nvim ~/.config/nvim

rm -rf ~/.config/ghostty
ln -fs $(pwd)/config-files/config/ghostty ~/.config/ghostty

rm -rf ~/.config/sway
ln -fs $(pwd)/config-files/config/sway ~/.config/sway

rm -rf ~/.config/waybar
ln -fs $(pwd)/config-files/config/waybar ~/.config/waybar
#
# ln -fs $(pwd)/config-files/config/ghostty ~/.config/ghostty
# ln -fs $(pwd)/config-files/config/ghostty ~/.config/ghostty
