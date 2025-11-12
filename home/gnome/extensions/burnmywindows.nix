{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.burn-my-windows
  ];
  
  dconf.settings = {
  ### Schließenanimation für alle Fenster
    "org/gnome/shell/extensions/burn-my-windows" = {
      active-profile = "aura-glow";
      effect = "aura-glow";
    };
  };  
}