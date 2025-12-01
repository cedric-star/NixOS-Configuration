{ pkgs, lib, config, inputs, ... }:

{
  stylix.enable = true;
  stylix.image = ./wallpapers/b1.png;
  stylix.base16Scheme = ./redpink.yaml;
  stylix.polarity = "dark";


  stylix.opacity = {
    applications = 0.85;
    terminal = 0.85;
    desktop = 0.85;
    popups = 0.85;
  };

  stylix.cursor = {
    package = pkgs.lyra-cursors;
    name = "LyraF-cursors";
    size = 26;
  };



  # Stylix Einstellungen anpassen
  #stylix = {
  #  autoEnable = true;
  #  targets.qt.enable = true;
  #  targets.qt.platform = lib.mkForce "qtct";  # Konflikt auflösen
    # oder alternativ:
    # targets.qt.platform = lib.mkDefault "qtct";
  };

}


