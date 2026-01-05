{config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    xwayland-satellite
    swaybg
    libnotify
    pamixer
    wl-clipboard-rs
  ];

  home.file.".config/niri/config.kdl" = {
    source = ./config.kdl;
  };
}