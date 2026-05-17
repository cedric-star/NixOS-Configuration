{ config, pkgs, ...}:

{
  imports = [
    ./base.nix
    ./boot.nix
    ./networking.nix
    ./system_programs
    ./flatpak
    ./virt.nix
    ./location.nix
  ];
}