{ pkgs, lib, config, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./system
      ./stylix
      ./nvf
  ];   

  myvim.enable = true;

}
