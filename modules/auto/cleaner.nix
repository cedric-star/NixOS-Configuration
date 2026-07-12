{ config, lib, pkgs, inputs, ...}:

{
### Garbage Collection (/nix/store)
  nix.gc = {
    automatic = false;
    dates = "daily";
    options = "--delete-older-than 5d";
  };

### Store Optimisation
  nix.optimise = {
    automatic = false;
    dates = [ "daily" ];
  };

}