{ pkgs, lib, config, inputs, ... }:

{
  stylix = {
    enable = true;
    autoEnable = false;
    enableReleaseChecks = false;

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Original-Ice-Right";
      size = 30;
    };

    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono Nerd Font";
      };
    };

    image = ./default.jpg;
  };

}


