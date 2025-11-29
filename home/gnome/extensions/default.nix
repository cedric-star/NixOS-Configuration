{ config, pkgs, ... }:

{
  imports = [
    ./burnmywindows.nix
    ./transparentwindowmoving.nix
    ./astramonitor.nix
    ./blurmyshell.nix
    ./logomenu.nix
    ./clipboardindicator.nix
    ./openbar.nix
    ./roundedcorners.nix
    #./forge.nix
  ];


  home.packages = with pkgs; [
    gnomeExtensions.blur-my-shell
    gnomeExtensions.user-themes 
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.logo-menu
    gnomeExtensions.transparent-window-moving
    gnomeExtensions.burn-my-windows
    gnomeExtensions.open-bar
    gnomeExtensions.vitals
    gnomeExtensions.forge
    gnomeExtensions.rounded-window-corners-reborn
  ];


  dconf.settings = {
    "org/gnome/shell" = {
      disabled-extensions = [#
        "openbar@neuromorph"
      ];
      enabled-extensions = [#cli: 'gnome-extensions list'
        "blur-my-shell@aunetx"
        "clipboard-indicator@tudmotu.com"
        "logomenu@aryan_k"
        "transparent-window-moving@noobsai.github.com" 
        "burn-my-windows@schneegans.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com" 
        "forge@jmmaranan.com"
        "rounded-window-corners@fxgn"
        #"openbar@neuromorph"
      ];
    };
  };
}