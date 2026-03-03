{ config, pkgs, ... }:

{
  services.userborn.enable = true;
  system.etc.overlay = {
    enable = true;
    mutable = true;
  };

  boot.initrd.systemd = {
    enable = true;
    tpm2 = {
      enable = true;
    };
    dbus = {
      enable = true;
    };
  };

  systemd = {
    enableStrictShellChecks = true;
    globalEnvironment = {
      GLIBC_TUNABLES = "glibc.malloc.hugetlb=1";
      PROTON_FSR4_UPGRADE = "1";
      PROTON_FSR4_RDNA3_UPGRADE = "1";
      PROTON_ENABLE_WAYLAND = "1";
      PROTON_NO_WM_DECORATION = "1";
      PROTON_ENABLE_HDR = "1";
      DXVK_HDR = "1";
      PROTON_USE_NTSYNC = "1";
      PROTON_LOCAL_SHADER_CACHE = "1";
      PROTON_PREFER_SDL = "1";
      MESA_SHADER_CACHE_MAX_SIZE = "32G";
      ENABLE_LAYER_MESA_ANTI_LAG = "1";
      RUSTICL_ENABLE = "radeonsi";
      RADV_DEBUG = "zerovram";
      radeonsi_zerovram = "true";
      RADV_PERFTEST = "video_decode,video_encode,sam,localbos,nircache,sparse";
      AMD_DEBUG = "lowlatencydec,lowlatencyenc,w64ge,w64ps,w64cs,dpbb,export_modifier";
      ENABLE_HDR_WSI = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";
      CLUTTER_BACKEND = "wayland";
      SDL_VIDEODRIVER = "wayland,x11";
      ELM_DISPLAY = "wl";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
    };
    tpm2 = {
      enable = true;
    };
    oomd = {
      enable = true;
      enableRootSlice = true;
      enableUserSlices = true;
    };
  };
}
