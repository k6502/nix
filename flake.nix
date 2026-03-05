{
  description = "kptr.nix";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming-edge = {
      url = "github:powerofthe69/nix-gaming-edge";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware/master";
    };
  };

  outputs =
    {
      nixpkgs,
      fenix,
      nix-gaming-edge,
      nixos-hardware,
      ...
    }:
    {

      nixosConfigurations.lambda = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          nixos-hardware.nixosModules.msi-b550-a-pro
          nix-gaming-edge.nixosModules.default
          (
            { pkgs, ... }:
            {
              nixpkgs.overlays = [
                fenix.overlays.default
                nix-gaming-edge.overlays.default
                nix-gaming-edge.overlays.proton-cachyos
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
