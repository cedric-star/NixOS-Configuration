{ pkgs, inputs ... }:

{
  imports = [
    ./firefox.nix
    ./vscodium.nix
    ./kitty.nix
    ./nvim.nix
  ];
   
}
