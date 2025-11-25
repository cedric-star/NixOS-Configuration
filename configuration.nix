{ pkgs, lib, config, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./system
    ]; 

  stylix.image = ./home/gnome/wallpapers/b1.png
  
}
