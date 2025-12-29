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
    ./popshell.nix
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
    gnomeExtensions.rounded-window-corners-reborn
    gnomeExtensions.pop-shell
  ];

  dconf.settings = {
    "org/gnome/shell" = {
      disabled-extensions = [#
        #"openbar@neuromorph"
        "rounded-window-corners@fxgn"
      ];
      enabled-extensions = [#cli: 'gnome-extensions list'
        "blur-my-shell@aunetx"
        "clipboard-indicator@tudmotu.com"
        "logomenu@aryan_k"
        "transparent-window-moving@noobsai.github.com" 
        "burn-my-windows@schneegans.github.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "Vitals@CoreCoding.com" 
        "pop-shell@system76.com"
        "openbar@neuromorph"
      ];
    };
  };
}