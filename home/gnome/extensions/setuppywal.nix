{ config, pkgs, ... }:

let pywal-nix = import (pkgs.fetchFromGitHub {
  owner = "Fuwn";
  repo = "pywal.nix";
  rev = "main";
  hash = "iQU1Rv7Q0BFdsIX9c7mxDhhYaWemuaNRYs+sR1DF0Rc=";
});

in {
  imports = [
    pywal-nix.homeManagerModules.${pkgs.system}.default
  ];

  pywal-nix = {
    wallpaper = ../wallpapers/b1.png;
    light = false;
    backend = "wal";
    enableKittyIntegratioin = true;
  };
}