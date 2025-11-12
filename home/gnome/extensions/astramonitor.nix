{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell/extensions/astra-monitor" = {
      compact-mode = true;
    };
  };
}
