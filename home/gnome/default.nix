{ config, pkgs, ... }:

{
  imports = [
    ./settings.nix
    ./extensions
  ];
}
