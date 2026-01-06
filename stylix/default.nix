{ pkgs, lib, config, inputs, ... }:

{
  stylix.enableReleaseChecks = false;
  stylix.autoEnable = true;

  stylix.enable = true;
  stylix.image = ./wallpapers/b1.png;
  stylix.base16Scheme = ./redpink.yaml;
  stylix.polarity = "dark";


  stylix.opacity = {
    applications = 1;
    terminal = 1;
    desktop = 1;
    popups = 1;
  };

  stylix.cursor = {
    package = pkgs.lyra-cursors;
    name = "LyraX-cursors";
    size = 26;
  };
}


