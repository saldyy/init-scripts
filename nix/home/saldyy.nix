{ config, pkgs, inputs, vars, ... }:

let
  link = path: config.lib.file.mkOutOfStoreSymlink "${vars.dotfilesDir}/${path}";
in
{
  home.username = vars.username;
  home.homeDirectory = "/home/${vars.username}";

  # Dotfiles stay editable in the repo (replaces symlink_setup.sh)
  home.file = {
    ".zshrc".source = link "config-files/zshrc";
    ".tmux.conf".source = link "config-files/tmux.conf";
    ".gitconfig".source = link "config-files/gitconfig";
    ".tmux/plugins/tpm".source = inputs.tpm;
  };

  xdg.configFile = {
    "nvim".source = link "nvim";
    "sway".source = link "config-files/config/sway";
    "waybar".source = link "config-files/config/waybar";
    "rofi".source = link "config-files/config/rofi";
    "wezterm".source = link "config-files/config/wezterm";
    "ghostty".source = link "config-files/config/ghostty";
  };

  xdg.dataFile."nvim/site/autoload/plug.vim".source = "${inputs.vim-plug}/plug.vim";

  # LSP servers enabled in nvim/after/plugin/lsp.lua (Mason is skipped on NixOS)
  home.packages = with pkgs; [
    go
    gopls
    golangci-lint
    golangci-lint-langserver
    templ
    typescript-language-server
    vscode-langservers-extracted # eslint, html
    tailwindcss-language-server
    biome
    lua-language-server
    pyright
    dockerfile-language-server
    docker-compose-language-service
  ];

  home.stateVersion = "25.11";
}
