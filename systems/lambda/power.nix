{ ... }:

{
  services.power-profiles-daemon.enable = false;
  services.tlp = {
    enable = true;
    pd = {
      enable = true;
    };
    settings = {
      # CPU
      CPU_DRIVER_OPMODE_ON_AC = "active";
      CPU_DRIVER_OPMODE_ON_BAT = "active";
      CPU_DRIVER_OPMODE_ON_SAV = "active";
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "performance";
      CPU_SCALING_GOVERNOR_ON_SAV = "performance";
      CPU_SCALING_MIN_FREQ_ON_AC = 4954565;
      CPU_SCALING_MAX_FREQ_ON_AC = 4954565;
      CPU_SCALING_MIN_FREQ_ON_BAT = 4954565;
      CPU_SCALING_MAX_FREQ_ON_BAT = 4954565;
      CPU_SCALING_MIN_FREQ_ON_SAV = 4954565;
      CPU_SCALING_MAX_FREQ_ON_SAV = 4954565;
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "performance";
      CPU_ENERGY_PERF_POLICY_ON_SAV = "performance";
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 1;
      CPU_BOOST_ON_SAV = 1;

      # DISKS/FILESYSTEM RELATED
      DISK_IDLE_SECS_ON_AC = 0;
      DISK_IDLE_SECS_ON_BAT = 0;
      MAX_LOST_WORK_SECS_ON_AC = 5;
      MAX_LOST_WORK_SECS_ON_BAT = 5;
      DISK_DEVICES = "sda sdb";
      DISK_APM_LEVEL_ON_AC = "255 255";
      DISK_APM_CLASS_DENYLIST = "usb";
      DISK_SPINDOWN_TIMEOUT_ON_AC = "0 0";
      DISK_SPINDOWN_TIMEOUT_ON_BAT = "0 0";
      DISK_IOSCHED = "kyber kyber";
      SATA_LINKPWR_ON_AC = "max_performance";
      SATA_LINKPWR_ON_BAT = "max_performance";
      AHCI_RUNTIME_PM_ON_AC = "on";
      AHCI_RUNTIME_PM_ON_BAT = "on";
      AHCI_RUNTIME_PM_TIMEOUT = 0;

      # PLATFORM
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "performance";
      PLATFORM_PROFILE_ON_SAV = "performance";

      # PCIE
      RUNTIME_PM_ON_AC = "on";
      RUNTIME_PM_ON_BAT = "on";
      PCIE_ASPM_ON_AC = "performance";
      PCIE_ASPM_ON_BAT = "performance";

      # USB
      USB_AUTOSUSPEND = 0;

      # AUDIO
      SOUND_POWER_SAVE_ON_AC = 0;
      SOUND_POWER_SAVE_ON_BAT = 0;
      SOUND_POWER_SAVE_CONTROLLER = "N";
    };
  };
}
