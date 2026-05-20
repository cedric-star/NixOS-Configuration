{ config, pkgs, ...}:

{
  imports = [
    ./fuzzel
    ./wlogout
    ./waybar
    ./fastfetch
    ./firefox.nix
    ./vscodium.nix
    ./kitty.nix
    ./git.nix
  ];
}