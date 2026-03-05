{ pkgs, ... }:

{
  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      nix-direnv = {
        enable = true;
      };
    };
    zsh = {
      enable = true;
      zsh-autoenv = {
        enable = true;
      };
      syntaxHighlighting = {
        enable = true;
        highlighters = [
          "main"
          "brackets"
          "pattern"
          "cursor"
          "regexp"
          "root"
          "line"
        ];
      };
      ohMyZsh = {
        enable = true;
        preLoaded = ''
          zstyle :omz:plugins:ssh-agent agent-forwarding yes
        '';
        plugins = [
          "git"
          "direnv"
          "fzf"
          "git-auto-fetch"
          "gpg-agent"
          "ssh-agent"
          "rust"
          "ssh"
        ];
        theme = "fino";
      };
      enableLsColors = true;
      enableGlobalCompInit = true;
      enableCompletion = true;
      enableBashCompletion = true;
      autosuggestions = {
        enable = true;
        strategy = [
          "history"
          "completion"
          "match_prev_cmd"
        ];
      };
    };
  };
  users.users.kptr = {
    isNormalUser = true;
    description = "kptr";
    shell = pkgs.zsh;
    extraGroups = [
      "users"
      "wheel"
      "video"
      "render"
      "input"
      "tss"
    ];
    packages = with pkgs; [
      vesktop
      fastfetch
      alacritty
      direnv
      nix-direnv
      (prismlauncher.override {
        # GraalVM has proven superiority in terms of performance for both clients and servers
        jdks = [
          graalvmPackages.graalvm-oracle
        ];
      })
    ];
  };
}
