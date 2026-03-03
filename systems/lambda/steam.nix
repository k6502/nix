{ pkgs, ... }:

{
  programs.steam = {
    enable = true;
    extest = {
      enable = true;
    };
    protontricks = {
      enable = true;
    };
    extraCompatPackages = with pkgs; [
      proton-cachyos-x86_64-v3
    ];
  };
}
