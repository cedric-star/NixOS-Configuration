{ config, pkgs, ...}:

{
  imports = [
    ./auto
    ./stylix
    ./system
    ./programs
    ./flatpak
  ];
}