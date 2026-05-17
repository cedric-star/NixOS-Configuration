{ config, pkgs, ...}:

{
  imports = [
    ./base.nix
    ./networking.nix
    ./system_programs
    ./flatpak
    ./virt.nix
    ./location.nix
  ];
}