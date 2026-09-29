{ pkgs, vars, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/desktop.nix
    ../../modules/packages.nix
    ../../modules/dev.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = vars.hostname;
  networking.networkmanager.enable = true;

  # time.timeZone = "Asia/Ho_Chi_Minh";
  i18n.defaultLocale = "en_US.UTF-8";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.zsh = {
    enable = true;
    # ~/.zshrc runs its own compinit
    enableGlobalCompInit = false;
  };

  users.users.${vars.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
  };

  system.stateVersion = "25.11";
}
