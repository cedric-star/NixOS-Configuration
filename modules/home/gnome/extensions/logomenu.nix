{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell/extensions/Logo-menu" = {
      menu-button-icon-image = 23;
      menu-button-icon-size = 24;
      symbolic-icon = true;
    };
  };
}