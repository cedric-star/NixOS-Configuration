{ pkgs, lib, config, inputs, ... }:

{
  stylix.enable = false;
  stylix.enableReleaseChecks = false;
  stylix.autoEnable = false;

  stylix.image = ./wallpapers/b1.png;
  stylix.base16Scheme = ./redpink.yaml;
  stylix.polarity = "dark";



  stylix.cursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Original-Ice-Right";
    size = 30;
  };

  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
  };


}


