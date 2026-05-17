{ pkgs, lib, config, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./boot.nix
      ../../modules/system
      ../../modules/stylix
  ];  

  networking.hostName = "hp-buch"; # Define your hostname.
  system.stateVersion = "25.05"; 


}
