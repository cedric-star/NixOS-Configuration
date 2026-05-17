{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell/extensions/clipboard-indicator" = {
      clear-on-boot = true;
      cache-size = 7; #für bilder, max 7mb speichern
    };
  };
}
