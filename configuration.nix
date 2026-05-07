{ pkgs, lib, config, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./system
      ./stylix
      ./nvf
  ];   

  programs.myvim.enable = true;

}
