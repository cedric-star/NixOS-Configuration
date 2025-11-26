{ pkgs, lib, config, inputs, ... }:

{
  stylix.enable = true;
  stylix.image = ./wallpapers/b1.png;
  stylix.base16Scheme = ./redpink.yaml;
  stylix.polarity = "dark";

  stylix.fonts = {
    enable = true;
    monospace = {
      package = pkgs.nerdfonts.override {fonts = ["JetBrainsmono"];};
      name = "JetBrainsMono Nerd Font Mono Bold";
    };
  };

}
