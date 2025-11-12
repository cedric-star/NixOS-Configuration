{ config, lib, pkgs, inputs, ...}:

{
  system.autoUpgrade = {
    enable = true;
    flake = /etc/nixos
  }
}