{ config, pkgs, ...}:

{
  imports = [
    ./fuzzel
    ./wlogout
    ./waybar
  ];
}