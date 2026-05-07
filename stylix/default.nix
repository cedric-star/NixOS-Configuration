{ pkgs, lib, config, inputs, ... }:

{
  stylix.enableReleaseChecks = false;
  stylix.autoEnable = true;

  stylix.enable = true;
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

  programs.vscodium.enable = true;

}


