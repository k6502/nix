{ pkgs, ... }:

{
  networking = {
    hostName = "lambda";
    tempAddresses = "enabled";
    search = [ "~." ];
    networkmanager = {
      enable = true;
      dhcp = "internal";
      dns = "systemd-resolved";
      ethernet = {
        macAddress = "random";
      };
    };
    firewall = {
      enable = true;
      backend = "nftables";
      checkReversePath = "strict";
      filterForward = true;
      extraInputRules = ''
        ct state invalid drop
        ct state { established, related } accept
      '';
    };
    nftables = {
      enable = true;
      flushRuleset = true;
      checkRuleset = true;
    };
    stevenblack = {
      enable = true;
      block = [
        "fakenews"
        "gambling"
        "porn"
        "social"
      ];
    };
  };
  services = {
    resolved = {
      enable = true;
      settings = {
        Resolve = {
          DNS = [
            "1.1.1.1#cloudflare-dns.com"
            "1.0.0.1#cloudflare-dns.com"
            "2606:4700:4700::1111#cloudflare-dns.com"
            "2606:4700:4700::1001#cloudflare-dns.com"
          ];
          Domains = [ "~." ];
          DNSOverTLS = "yes";
          DNSSEC = "true";
        };
      };
    };
  };
  environment.defaultPackages = with pkgs; [
    stevenblack-blocklist
  ];
}
