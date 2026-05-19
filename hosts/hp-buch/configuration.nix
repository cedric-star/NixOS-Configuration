{ pkgs, lib, config, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./boot.nix
      ../../modules
  ];  

  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "hp-buch";
  system.stateVersion = "25.05"; 


}
