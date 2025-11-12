{ config, lib, pkgs, inputs, ...}:

{
  # update flakes
  system.autoUpgrade = {
    enable = true;
    flake = "/etc/nixos";
    operation = "switch"; # Änderung sofort übernehmen
    dates = "weekly";

    flags = [
      "--update-input" #flake updaten
      "nixpkgs"        # pakete von flake updaten 
      "-L"];
  };


}
#für zeiten: man systemd.time
#               minutely → *-*-* *:*:00
#                 hourly → *-*-* *:00:00
#                  daily → *-*-* 00:00:00
#                monthly → *-*-01 00:00:00
#                 weekly → Mon *-*-* 00:00:00
#                 yearly → *-01-01 00:00:00