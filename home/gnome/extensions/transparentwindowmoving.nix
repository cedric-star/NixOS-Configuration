{ config, pkgs, ... }:

{
  dconf.settings = {
    ### Transparenz von Fenstern beim verschieben
    "org/gnome/shell/extensions/transparent-window-moving" = {
      enable = true;
      opacity = 70; # Noch transparenter während Bewegung
      clear-on-boot = true;
    };
  };
}
