{ config, lib, pkgs, inputs, ... }:

let
  # Pakete aus den Inputs extrahieren
  quickshell-pkg = inputs.quickshell.packages.${pkgs.system}.default;
  qml-niri-pkg = inputs.qml-niri.packages.${pkgs.system}.default;
in
{
  home.packages = with pkgs; [
    # Über Inputs importierte Pakete
    quickshell-pkg
    qml-niri-pkg
    
    # Systempakete
    niri
    qt6.qtdeclarative
    qt6.qtwayland
    qt6.qtsvg
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

}