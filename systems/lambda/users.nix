{ config, pkgs, ... }:

{
  users.users.kptr = {
    isNormalUser = true;
    description = "kptr";
    extraGroups = [
      "users"
      "wheel"
      "video"
      "render"
      "input"
      "tss"
    ];
    packages = with pkgs; [
      vesktop
      fastfetch
      alacritty
    ];
  };
}
