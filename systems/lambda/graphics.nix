{ pkgs, ... }:

{
  hardware = {
    amdgpu = {
      initrd = {
        enable = true;
      };
      overdrive = {
        enable = true;
        ppfeaturemask = "0xfff7ffff";
      };
      opencl = {
        enable = true;
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
  drivers.mesa-git = {
    enable = true;
    cacheCleanup = {
      enable = true;
    };
    steamOrphanCleanup = {
      enable = true;
    };
  };
}
