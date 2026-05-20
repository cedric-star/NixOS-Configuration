{ config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    cargo
    rustc 
    rustfmt 
    clippy 
    rust-analyzer
  ];

  env.RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}