{ config, pkgs, ... }:

{
  #shift+super+w wenns nicht mehr tiled
  dconf.settings = {
    "org/gnome/shell/extensions/pop-shell" = {
      active-hint = true;
    };
  };
}