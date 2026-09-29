# PLACEHOLDER — replace with the generated file after installing NixOS:
#   cp /etc/nixos/hardware-configuration.nix nix/hosts/workstation/
# The values below only exist so the flake evaluates before that.
{ ... }:

{
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-label/boot";
    fsType = "vfat";
  };

  nixpkgs.hostPlatform = "x86_64-linux";
}
