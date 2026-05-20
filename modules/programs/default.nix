{ config, pkgs, ...}:

{
  imports = [
    ./programs.nix
    ./python.nix
    ./steam.nix
    ./syncthing.nix
    ./mosquitto.nix
    ./uxplay.nix
    #./rust.nix
  ];
}