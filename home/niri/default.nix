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

  programs.waybar = {
    enable = true;
    systemd.enable = false; 
    package = pkgs.waybar;
  }
}