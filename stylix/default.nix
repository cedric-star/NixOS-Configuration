{ pkgs, lib, config, inputs, ... }:

{
  stylix.enable = true;
  stylix.image = ./wallpapers/b1.png;
  stylix.base16Scheme = ./redpink.yaml;
  stylix.polarity = "dark";


  stylix.opacity = {
    applications = 0.5;
    terminal = 0.5;
    desktop = 0.5;
    popups = 0.5;
  }
}


