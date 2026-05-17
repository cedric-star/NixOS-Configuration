{ config, pkgs, ...}:

{
  imports = [
    ./base.nix
    ./boot.nix
    ./networking.nix
    ./system_programs
    ./flatpak
    ./auto
    ./virt.nix
    ./location.nix
  ];
}