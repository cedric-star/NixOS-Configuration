{ config, pkgs, ... }:

{
  dconf.settings = {
    ### Blur My Shell alles blurryyyy
    "org/gnome/shell/extensions/blur-my-shell" = {
      blur = false;
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      blur = false;
    };
}
