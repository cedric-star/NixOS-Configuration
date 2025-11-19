{ config, pkgs, ... }:

{
  imports = [
    ./extensions
    ./settings.nix
    ./mytheme.nix
  ];
}
