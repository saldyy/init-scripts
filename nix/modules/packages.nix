{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Apps
    gimp
    nautilus
    vlc
    evince
    obs-studio
    kooha

    # System utilities
    git
    gh
    curl
    unzip
    jq
    ripgrep
    fzf
    tldr
    openssl
    nmap
    htop
    xorg.xrandr
    wdisplays
    lazygit
    fastfetch
    tmux

    # Shell: ~/.zshrc sources $ZPLUG_INIT
    zplug

    # Needed by nvim plugins at install time (telescope-fzf-native,
    # nvim-treesitter parsers, markdown-preview)
    gcc
    gnumake
    tree-sitter
    nodejs
  ];

  environment.sessionVariables.ZPLUG_INIT = "${pkgs.zplug}/share/zplug/init.zsh";

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  services.flatpak.enable = true;
}
