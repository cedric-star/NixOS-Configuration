{ pkgs, inputs, ... }:

{
  home.file.".config/waybar/nixos.svg".source = ./nixos.svg;

  programs.waybar = {
  
    enable = false;

    #style = builtins.readFile ./style3.css;

    #settings = builtins.readFile ./config.jsonc;

  };
}
