{ config, pkgs, ...}:

{
  imports = [
    ./programs.nix
    ./python.nix
    ./steam.nix
  ];
}