{config, lib, pkgs, ...}:

{
  imports = [
    ./quickshell
  ];

  home.packages = with pkgs; [
    xwayland-satellite
    swaybg
    libnotify
    pamixer
    wl-clipboard-rs
    waybar
    swww
    wofi

    # Quickshell Paket
    inputs.quickshell.packages.${pkgs.system}.default
    
    # QML-Niri Paket
    inputs.qml-niri.packages.${pkgs.system}.default
  ];

  home.file.".config/niri/config.kdl".source = ./config.kdl;
  home.file.".config/niri/b1.png".source = ../../stylix/wallpapers/b1.png;

}