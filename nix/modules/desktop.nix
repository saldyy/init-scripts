{ pkgs, ... }:

{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    # Everything config-files/config/sway/config execs
    extraPackages = with pkgs; [
      swaylock
      swayidle
      swaybg
      grim
      slurp
      wl-clipboard
      rofi
      waybar
      pavucontrol
      wezterm
      ghostty
    ];
  };

  services.greetd = {
    enable = true;
    settings.default_session.command =
      "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd sway";
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  security.polkit.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [ pkgs.qt6Packages.fcitx5-unikey ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.hack # ghostty
    jetbrains-mono # wezterm
  ];
}
