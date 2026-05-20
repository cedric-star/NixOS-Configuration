{ config, pkgs, ...}:

{
  imports = [
    ./fuzzel
    ./wlogout
    ./waybar
    ./firefox.nix
    ./vscodium.nix
    ./kitty.nix
    ./git.nix
  ];
}