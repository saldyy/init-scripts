{
  description = "saldyy's NixOS + Sway workstation";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Non-flake sources, pinned in flake.lock
    vim-plug = {
      url = "github:junegunn/vim-plug";
      flake = false;
    };
    tpm = {
      url = "github:tmux-plugins/tpm";
      flake = false;
    };
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      username = "saldyy";
      hostname = "workstation";
      # Absolute path of this checkout; dotfiles are symlinked from here
      dotfilesDir = "/home/${username}/Documents/init-scripts";

      vars = { inherit username hostname dotfilesDir; };
    in
    {
      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs vars; };
        modules = [
          ./nix/hosts/${hostname}/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs vars; };
            home-manager.users.${username} = import ./nix/home/${username}.nix;
          }
        ];
      };
    };
}
