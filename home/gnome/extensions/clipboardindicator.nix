{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell/extensions/clipboard-indicator" = {
      clear-on-boot = true;
    };
  };
}
