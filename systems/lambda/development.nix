{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    python315FreeThreading
    page
    nodejs_25
    pnpm
    luajit
    luajitPackages.luarocks
    fd
    ripgrep
    fzf
    meson
    cmake
    libgccjit
    libgcc
    gcc
    tree-sitter
    gnumake
    (pkgs.fenix.complete.withComponents [
      "cargo"
      "clippy"
      "rust-src"
      "rustc"
      "rustfmt"
    ])
    pkgs.rust-analyzer-nightly
  ];
}
