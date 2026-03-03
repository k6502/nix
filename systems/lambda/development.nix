{ config, pkgs, ... }:

{
  environment.systemPackages = [
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
