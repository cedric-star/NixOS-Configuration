{ config, lib, pkgs, inputs, ...}:

{
### Garbage Collection (/nix/store)
  nix-gc = {
    automatic = true;
    dates = "daily";
  };

### Store Optimisation
  nix.optimise = {
    automatic = true;
    dates = "daily";
  };

### Boot Generations



}