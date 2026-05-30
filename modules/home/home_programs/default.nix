{ config, pkgs, ...}:

{
  imports = [
    ./fuzzel
    ./wlogout
    ./waybar
    ./fastfetch
    ./firefox.nix
    ./kitty.nix
    ./git.nix
  ];
}