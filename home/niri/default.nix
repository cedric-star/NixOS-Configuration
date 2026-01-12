# home.nix
{ config, lib, pkgs, inputs, ... }:

let
  quickshell-with-niri = inputs.qml-niri.packages.${system}.quickshell;
  qml-niri-plugin = inputs.qml-niri.packages.${system}.default;
in
{
  imports = [
  
  ];

  home.packages = with pkgs; [
    # Quickshell mit qml-niri Plugin
    quickshell-with-niri
    
    # QML-Niri Plugin (falls separat benötigt)
    qml-niri-plugin
    
    # Niri und Wayland
    niri
    niri-effects
    
    # Qt für QML/Quickshell
    qt6.full
    qt6.qtwayland
    qt6.qtdeclarative
    qt6.qtsvg
    qt6.qttools
    
    # Wayland Tools
    xwayland-satellite
    waybar
    swww
    wofi
    
    # Utilities
    swaybg
    libnotify
    pamixer
    wl-clipboard-rs

  ];

  # Quickshell Service
  services.quickshell = {
    enable = true;
    # Konfigurationsdatei (optional)
    # config = ./quickshell/main.qml;
  };

  # Niri Konfiguration
  home.file.".config/niri/config.kdl".source = ./config.kdl;
  home.file.".config/niri/b1.png".source = ../../stylix/wallpapers/b1.png;

}