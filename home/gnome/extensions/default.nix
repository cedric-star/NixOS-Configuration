{ config, pkgs, ... }:

{
  imports = [
    ./burnmywindows.nix
  ];
  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.burn-my-windows
    gnomeExtensions.transparent-window-moving
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.logo-menu
    gnomeExtensions.astra-monitor
  ];





  dconf.settings = {
    "org/gnome/shell" = {

### Alle Erweiterungen
      disabled-extensions = [ ];
      enabled-extensions = [#gnome-extensions list
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "burn-my-windows@schneegans.github.com"
        "transparent-window-moving@noobsai.github.com"
        "clipboard-indicator@tudmotu.com"
        "logomenu@aryan_k"
        "monitor@astraext.github.io"
      ];



    };


    "org/gnome/shell/extensions/Logo-menu" = {
      menu-button-icon-image = 23;
      menu-button-icon-size = 24;
      symbolic-icon = true;
    };

    "org/gnome/shell/extensions/astra-monitor" = {
      compact-mode = true;

    };

### Blur My Shell alles blurryyyy
    "org/gnome/shell/extensions/blur-my-shell" = {
      blur = true;
    };


### Transparenz von Fenstern beim verschieben
    "org/gnome/shell/extensions/transparent-window-moving" = {
      enable = true;
      opacity = 70; # Noch transparenter während Bewegung
    };

### Schließenanimation für alle Fenster
    "org/gnome/shell/extensions/burn-my-windows" = {
      active-profile = "aura-glow";
      effect = "aura-glow";
    };
  };
}