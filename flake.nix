{
  description = "kptr.nix";

  inputs = {
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel/release";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
      fenix,
      ...
    }:
    {

      nixosConfigurations.lambda = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          (
            { pkgs, nix-cachyos-kernel, ... }:
            {
              nixpkgs.overlays = [
                fenix.overlays.default
                nix-cachyos-kernel.overlays.pinned
              ];
              environment.systemPackages = with pkgs; [
                nixfmt
                nixfmt-tree
                gitFull
                nix-ld
              ];

            }
          )
          ./systems/lambda/default.nix
        ];
      };
    };
}
