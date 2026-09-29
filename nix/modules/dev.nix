{ pkgs, vars, ... }:

{
  virtualisation.docker.enable = true;
  users.users.${vars.username}.extraGroups = [ "docker" ];

  # Run dynamically linked binaries downloaded outside Nix
  # (fnm-managed node, pnpm globals, Flutter, Android SDK)
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      zlib
      openssl
      glib
      libGL
      xorg.libX11
    ];
  };
}
