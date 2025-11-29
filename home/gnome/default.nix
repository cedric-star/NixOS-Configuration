{ config, pkgs, ... }:

{
  imports = [
    ./extensions
    ./settings.nix
    ./keybindings.nix
  ];
}
