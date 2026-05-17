{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell/extensions/rounded-window-corners-reborn" = {
      tweak-kitty-terminal = true;
    };
  };
}