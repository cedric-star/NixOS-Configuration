{config, lib, pkgs, ...}:
 
{
  home.file.".config/waybar/style.css".source = ./style.css; 
}