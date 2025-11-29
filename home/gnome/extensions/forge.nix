{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell/extensions/forge/keybindings" = {
      # Tiling und Layout
      con-split-horizontal = [];
      con-split-layout-toggle = [];
      con-split-vertical = [];
      con-stacked-layout-toggle = [];
      con-tabbed-layout-toggle = [];
      con-tabbed-showtab-decoration-toggle = [];
      prefs-tiling-toggle = [];
      
      # Fenster Fokus
      window-focus-down = [];
      window-focus-left = [];
      window-focus-right = [];
      window-focus-up = [];
      
      # Fenster Bewegung
      window-move-down = [];
      window-move-left = [];
      window-move-right = [];
      window-move-up = [];
      
      # Fenster Größe ändern
      window-resize-bottom-decrease = [];
      window-resize-bottom-increase = [];
      window-resize-left-decrease = [];
      window-resize-left-increase = [];
      window-resize-right-decrease = [];
      window-resize-right-increase = [];
      window-resize-top-decrease = [];
      window-resize-top-increase = [];
      
      # Fenster Positionierung
      window-snap-center = [];
      window-snap-down = [];
      window-snap-one-third-left = [];
      window-snap-one-third-right = [];
      window-snap-two-third-left = [];
      window-snap-two-third-right = [];
      window-snap-up = [];
      
      # Fenster Tausch und Float
      window-swap-down = [];
      window-swap-last-active = [];
      window-swap-left = [];
      window-swap-right = [];
      window-swap-up = [];
      window-toggle-always-float = [];
      window-toggle-float = [];
      
      # Workspace und andere Einstellungen
      workspace-active-tile-toggle = [];
      focus-border-toggle = [];
      window-gap-size-decrease = [];
      window-gap-size-increase = [];
      mod-mask-mouse-title = [];
    };
  };
}