{ config, lib, pkgs, inputs, ...}:

{
### Garbage Collection (/nix/store)
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5d";
  };

### Store Optimisation
  nix.optimise = {
    automatic = true;
    dates = [ "daily" ];
  };

### Boot Generations



}