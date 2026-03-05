{ pkgs, ... }:

{
  environment.defaultPackages = with pkgs; [
    cosmic-wallpapers
  ];
  services = {
    displayManager = {
      cosmic-greeter.enable = true;
    };
    desktopManager.cosmic.enable = true;
  };
}
