{ config, pkgs, ...}:

{
  imports = [
    ./programs.nix
    ./python.nix
  ];
}