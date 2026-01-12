{config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    xwayland-satellite
    swaybg
    libnotify
    pamixer
    wl-clipboard-rs
    waybar
    swww
    wofi
  ];

  home.file.".config/niri/config.kdl".source = ./config.kdl;
  home.file.".config/niri/b1.png".source = ../../stylix/wallpapers/b1.png;

  programs.waybar = {
    enable = true;
    systemd.enable = false; 
    package = pkgs.waybar;
  };
}