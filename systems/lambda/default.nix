{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ./boot.nix
    ./nix.nix # silly
    ./graphics.nix
    ./fonts.nix
    ./development.nix
    ./keyring.nix
  ];

  networking.hostName = "lambda"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Montevideo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.displayManager = {
    cosmic-greeter.enable = true;
  };
  services.desktopManager.cosmic.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
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
    packages = with pkgs; [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    kitty
    wget2
    chromium
  ];
  environment.variables = {
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
