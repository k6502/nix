{ config, pkgs, ... }:

{
  fonts = {
    enableDefaultPackages = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-lgc-plus
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      liberation_ttf
      lilex
      nerd-fonts.lilex
    ];
    fontDir = {
      enable = true;
      decompressFonts = true;
    };
    fontconfig = {
      enable = true;
      useEmbeddedBitmaps = true;
      includeUserConf = true;
      subpixel = {
        rgba = "rgb";
        lcdfilter = "light";
      };
      hinting = {
        enable = true;
        style = "slight";
      };
      defaultFonts = {
        serif = [ "Liberation Serif" ];
        sansSerif = [ "Liberation Sans" ];
        monospace = [
          "Lilex Nerd Font"
          "Lilex"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
