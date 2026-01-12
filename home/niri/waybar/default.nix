{config, lib, pkgs, ...}:
 
{
  programs.waybar = {
    enable = true;
    systemd.enable = false; 
    package = pkgs.waybar;
    style = ./style.css;
  };
}