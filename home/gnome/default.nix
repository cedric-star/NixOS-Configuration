{ config, pkgs, ... }:

{
  imports = [
    ./extensions
    ./settings.nix
  ];
}
