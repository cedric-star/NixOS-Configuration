{ pkgs, lib, config, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./system
  ]; 

  stylix.enable = true;
  stylix.image = ./home/gnome/wallpapers/b1.png;
  stylix.polarity = "dark";
  
}
