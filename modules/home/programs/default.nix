{ pkgs, inputs, ... }:

{
  imports = [
    ./firefox.nix
    ./vscodium.nix
    ./kitty.nix
    ./git.nix
    #./nvim.nix
  ];
   
}
