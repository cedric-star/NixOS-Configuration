{ config, pkgs, ...}:

{
  imports = [
    ./base.nix
    ./networking.nix
    ./virt.nix
    ./location.nix
  ];
}