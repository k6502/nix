{ ... }:

{
  security = {
    protectKernelImage = true;
    unprivilegedUsernsClone = true;
    forcePageTableIsolation = true;
    wrapperDirSize = "100%";

    tpm2 = {
      enable = true;
      abrmd = {
        enable = true;
      };
      tctiEnvironment = {
        enable = true;
        interface = "tabrmd";
      };
    };

    rtkit = {
      enable = true;
    };

    audit = {
      enable = "lock";
      backlogLimit = 65535;
    };

    auditd = {
      enable = true;
    };

    sudo.enable = false;
    sudo-rs.enable = false;
    run0 = {
      enableSudoAlias = true;
      wheelNeedsPassword = false;
    };

    isolate = {
      enable = true;
    };

    pam = {
      enableUMask = true;
    };
  };
}
