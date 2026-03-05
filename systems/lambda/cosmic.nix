{ pkgs, ... }:

{
  environment.defaultPackages = with pkgs; [
    cosmic-wallpapers
    variety
    xdg-utils
    xdg-utils-cxx
    xdg-user-dirs
    xdg-dbus-proxy
    xdg-user-dirs-gtk
    xdg-terminal-exec
  ];
  services = {
    displayManager = {
      cosmic-greeter = {
        enable = true;
      };
    };
    desktopManager.cosmic = {
      enable = true;
    };
  };

  services = {
    flatpak = {
      enable = true;
    };
  };
  xdg = {
    mime = {
      enable = true;
    };
    menus = {
      enable = true;
    };
    icons = {
      enable = true;
    };
    sounds = {
      enable = true;
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal
        xdg-desktop-portal-gtk
        xdg-desktop-portal-cosmic
      ];
    };
    autostart = {
      enable = true;
    };
    terminal-exec = {
      enable = true;
    };
  };
}
