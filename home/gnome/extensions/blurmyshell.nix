{ config, pkgs, ... }:

{
  dconf.settings = {
    ### Blur My Shell alles blurryyyy
    "org/gnome/shell/extensions/blur-my-shell" = {
      blur = true;
    };
  };
}
