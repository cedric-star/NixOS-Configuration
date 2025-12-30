{ pkgs, lib, config, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./system
      ./stylix
      ./noctalia
  ];   

}
