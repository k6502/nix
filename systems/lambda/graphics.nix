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
}
