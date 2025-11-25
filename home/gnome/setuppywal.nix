{ pkgs, ... }:

{
  imports = [
    (import (
      pkgs.fetchFromGitHub {
        owner = "Fuwn";
        repo = "pywal.nix";
        rev = "main";  # Use the current commit revision hash
        hash = "iQU1Rv7Q0BFdsIX9c7mxDhhYaWemuaNRYs+sR1DF0Rc="; # Use the current commit sha256 hash
      }
    )).homeManagerModules.${builtins.currentSystem}.default
  ];
  home.packages.pywal-nix = {
    wallpaper = ../wallpapers/b1.png;
    light = false;
    backend = "wal";
    enableKittyIntegration = true;
    
  };
}