{ config, pkgs, ... }:

{
  nix = {
    daemonCPUSchedPolicy = "batch";
    settings = {
      system-features = [
        "benchmark"
        "big-parallel"
        "kvm"
        "nixos-test"
      ];
      # even though some of these are defaults, i like to make sure they are enabled/disabled.
      experimental-features = [
        "auto-allocate-uids"
        "blake3-hashes"
        "ca-derivations"
        "cgroups"
        "dynamic-derivations"
        "flakes"
        "git-hashing"
        "nix-command"
        "verified-fetches
"
      ];
      auto-allocate-uids = true;
      auto-optimise-store = true;
      cores = 0;
      max-jobs = "auto";
      fsync-metadata = true;
      fsync-store-paths = true;
      download-buffer-size = 268435456;
      http-connections = 0;
      http2 = true;
      sandbox = true;
      sandbox-dev-shm-size = "100%";
      use-cgroups = true;
      use-xdg-base-directories = true;
    };
    gc = {
      automatic = true;
      persistent = true;
      dates = "daily";
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      enableParallelBuildingByDefault = true;
      checkMeta = true;
      contentAddressedByDefault = true;
      strictDepsByDefault = true;
      structuredAttrsByDefault = true;
    };
    hostPlatform = {
      gcc.arch = "native";
      gcc.tune = "native";
      system = "x86_64-linux";
    };
  };
  programs.nix-index.enable = true;
}
