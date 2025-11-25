{ config, pkgs, ... }:

{
  imports = [
    ./extensions
    ./settings.nix
    #./setuppywal.nix
    ./mytheme.nix
  ];
}
