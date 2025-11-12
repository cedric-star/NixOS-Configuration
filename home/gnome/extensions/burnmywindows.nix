{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.burn-my-windows
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      enabled-extensions = [ "burn-my-windows@schneegans.github.com "];
      disabled-extensions = [];
    };
  ### Schließenanimation für alle Fenster
    #"org/gnome/shell/extensions/burn-my-windows" = {
      #active-profile = "default";
     # effect = "aura-glow";

    #};
  };  
}