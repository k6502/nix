{ config, pkgs, ... }:

{
  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "auto";
      configurationLimit = 5;
      memtest86 = {
        enable = true;
      };
      edk2-uefi-shell = {
        enable = true;
      };
    };
    efi.canTouchEfiVariables = true;
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  boot.kernelParams = [
    "ro"
    "loglevel=0"
    "quiet"
    "splash"
    "audit=1"
    "audit_backlog_limit=65535"
    "pci=pcie_bus_perf,realloc"
    "pcie_aspm=force"
    "pcie_ports=native"
    "pcie_port_pm=force"
    "init_on_alloc=1"
    "init_on_free=1"
    "iomem=strict"
    "iommu=pt"
    "iommu.forcedac=1"
    "iommu.passthrough=1"
    "io_delay=none"
    "amd_pstate=active"
    "transparent_hugepage=madvise"
    "transparent_hugepage_shmem=advise"
    "transparent_hugepage_tmpfs=advise"
    "thp_anon=16K:always"
    "thp_anon=32K:always"
    "thp_anon=64K:always"
    "thp_anon=128K:always"
    "thp_anon=256K:always"
    "thp_anon=512K:madvise"
    "thp_anon=1024K:madvise"
    "thp_anon=2048K:madvise"
    "thp_shmem=16K:always"
    "thp_shmem=32K:always"
    "thp_shmem=64K:always"
    "thp_shmem=128K:always"
    "thp_shmem=256K:always"
    "thp_shmem=512K:advise"
    "thp_shmem=1024K:advise"
    "thp_shmem=2048K:advise"
    "hugetlb_free_vmemmap=on"
    "cgroup_favordynmods=true"
    "delayacct"
    "gbpages"
    "preempt=full"
  ];

  hardware = {
    cpu = {
      x86 = {
        msr = {
          enable = true;
          owner = "root";
          group = "root";
          mode = "0640";
          settings = {
            allow-writes = "on";
          };
        };
      };

      amd = {
        updateMicrocode = true;
        sev = {
          enable = true;
          user = "root";
          group = "kvm";
          mode = "0660";
        };
      };
    };
  };

  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483647;
    "vm.vfs_cache_pressure" = 25;
    "vm.dirty_background_bytes" = 134217728;
    "vm.dirty_bytes" = 335544320;
    "vm.defrag_mode" = 1;
    "vm.compaction_proactiveness" = 60;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 200;
    "vm.swappiness" = 200;
    "vm.extfrag_threshold" = 1000;
    "vm.hugetlb_optimize_vmemmap" = 1;
    "vm.mmap_rnd_bits" = 32;
    "vm.mmap_rnd_compat_bits" = 16;

    "net.core.netdev_budget" = 1200;
    "net.core.netdev_budget_usecs" = 8000;
    "net.core.netdev_max_backlog" = 16384;
    "net.core.rmem_default" = 1048576;
    "net.core.wmem_default" = 1048576;
    "net.core.rmem_max" = 16777216;
    "net.core.wmem_max" = 16777216;
    "net.core.optmem_max" = 65536;
    "net.core.default_qdisc" = "cake";
    "net.core.somaxconn" = 8192;

    "net.ipv4.tcp_congestion_control" = "bbr";
    "net.ipv4.tcp_rmem" = "8192 1048576 16777216";
    "net.ipv4.tcp_wmem" = "8192 1048576 16777216";
    "net.ipv4.tcp_fastopen" = 3;
    "net.ipv4.udp_rmem_min" = 8192;
    "net.ipv4.udp_wmem_min" = 8192;
    "net.ipv4.tcp_max_syn_backlog" = 8192;
    "net.ipv4.tcp_max_tw_buckets" = 2000000;
    "net.ipv4.tcp_tw_reuse" = 1;
    "net.ipv4.tcp_fin_timeout" = 10;
    "net.ipv4.tcp_slow_start_after_idle" = 0;
    "net.ipv4.tcp_keepalive_time" = 60;
    "net.ipv4.tcp_keepalive_intvl" = 10;
    "net.ipv4.tcp_keepalive_probes" = 6;
    "net.ipv4.tcp_mtu_probing" = 1;
    "net.ipv4.ip_local_port_range" = "10000 65535";
    "net.ipv4.tcp_syncookies" = 1;
    "net.ipv4.tcp_rfc1337" = 1;
    "net.ipv4.tcp_sack" = 1;
    "net.ipv4.tcp_dsack" = 1;
    "net.ipv4.tcp_ecn" = 1;
    "net.ipv4.tcp_ecn_fallback" = 1;
    "net.ipv4.conf.default.rp_filter" = 1;
    "net.ipv4.conf.all.rp_filter" = 1;
    "net.ipv4.conf.all.accept_redirects" = 0;
    "net.ipv4.conf.default.accept_redirects" = 0;
    "net.ipv4.conf.all.secure_redirects" = 0;
    "net.ipv4.conf.default.secure_redirects" = 0;
    "net.ipv4.conf.all.send_redirects" = 0;
    "net.ipv4.conf.default.send_redirects" = 0;
    "net.ipv4.tcp_thin_linear_timeouts" = 1;

    "net.ipv6.conf.all.accept_redirects" = 0;
    "net.ipv6.conf.default.accept_redirects" = 0;
    "net.ipv6.conf.all.temp_prefered_lft" = 14400;
    "net.ipv6.conf.all.temp_valid_lft" = 32400;
    "net.ipv6.conf.all.addr_gen_mode" = 3;
  };

  boot = {
    runSize = "100%";
    devSize = "100%";
    devShmSize = "100%";
    tmp = {
      cleanOnBoot = true;
      useTmpfs = true;
      tmpfsSize = "100%";
      tmpfsHugeMemoryPages = "advise";
    };
  };
}
