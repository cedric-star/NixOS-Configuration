{ pkgs, lib, config, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./boot.nix
      ../../modules
  ];  

  networking.hostName = "hp-buch"; # Define your hostname.
  system.stateVersion = "25.05"; 


}
