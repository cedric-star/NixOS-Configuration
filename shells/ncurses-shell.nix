{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "java-dev-shell";

  buildInputs = with pkgs; [
    ncurses
    gcc
    glibc.dev 
    stdenv.cc.libc
    raylib

  ];

  shellHook = ''
    codium .
  '';
}
### Ausführen: 
# nix-shell
