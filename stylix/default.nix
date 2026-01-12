{ pkgs, lib, config, inputs, ... }:

{
  stylix.enableReleaseChecks = false;
  stylix.autoEnable = true;

  stylix.enable = true;
  stylix.image = ./wallpapers/b1.png;
  stylix.base16Scheme = ./redpink.yaml;
  stylix.polarity = "dark";


  stylix.opacity = {
    applications = 1.0;
    terminal = 1.0;
    desktop = 1.0;
    popups = 1.0;
  };

  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Ice-Right";
    size = 36;
  };
}


