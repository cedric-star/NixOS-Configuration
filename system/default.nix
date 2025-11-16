{ config, pkgs, ...}:

{
  imports = [
    ./base.nix
    ./boot.nix
    ./networking.nix
    ./system_programs
    ./auto
    ./virt.nix
    ./location.nix
  ];
}