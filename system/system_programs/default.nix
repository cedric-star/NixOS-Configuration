{ config, pkgs, ...}:

{
  imports = [
    ./programs.nix
    ./python.nix
    ./java.nix
  ];
}