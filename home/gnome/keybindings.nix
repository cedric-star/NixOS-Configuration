{ config, pkgs, lib, ... }:


{
  dconf.settings = {
    "org/gnome/desktop/wm/keybindings" = {
      show-desktop = ['<Alt>'F1]; # alle fenster minimieren
      panel-run-dialog = ['<Alt>F2']; # gnome run fenster öffnen
      
      close = ['<Alt>F4']; # schließen
      
      
### move to specific workspace
      switch-to-workspace-1 = ['<Super>1'];
      switch-to-workspace-2 = ['<Super>2'];
      switch-to-workspace-3 = ['<Super>3'];
      switch-to-workspace-4 = ['<Super>4'];
      switch-to-workspace-5 = ['<Super>5'];
      switch-to-workspace-6 = ['<Super>6'];
      switch-to-workspace-7 = ['<Super>7'];
      switch-to-workspace-8 = ['<Super>8'];
      switch-to-workspace-9 = ['<Super>9'];

### move windows to specific workspace
      move-to-workspace-1 = ['<Alt>1'];
      move-to-workspace-2 = ['<Alt>2'];
      move-to-workspace-3 = ['<Alt>3'];
      move-to-workspace-4 = ['<Alt>4'];
      move-to-workspace-5 = ['<Alt>5'];
      move-to-workspace-6 = ['<Alt>6'];
      move-to-workspace-7 = ['<Alt>7'];
      move-to-workspace-8 = ['<Alt>8'];
      move-to-workspace-9 = ['<Alt>9'];


### sachen ausstellen
      activate-window-menu = [];
      begin-move = [];
      begin-resize = [];
      cycle-group = [];
      cycle-group-backward = [];
      cycle-panels = [];
      cycle-panels-backward = [];
      cycle-windows = [];
      cycle-windows-backward = [];
      lower = [];
      maximize = [];###
      maximize-horizontally = [];
      maximize-vertically = [];
      minimize = [];###
      move-to-center = [];
      move-to-corner-ne = [];
      move-to-corner-nw = [];
      move-to-corner-se = [];
      move-to-corner-sw = [];
      move-to-monitor-down = [];
      move-to-monitor-left = [];
      move-to-monitor-right = [];
      move-to-monitor-up = [];
      move-to-side-e = [];
      move-to-side-n = [];
      move-to-side-s = [];
      move-to-side-w = [];
      move-to-workspace-down = [];
      move-to-workspace-last = [];
      move-to-workspace-left = [];
      move-to-workspace-right = [];
      move-to-workspace-up = [];
      raise = [];
      raise-or-lower = [];
      switch-applications = [];
      switch-applications-backward = [];
      switch-group = [];
      switch-group-backward = [];
      switch-input-source = [];
      switch-input-source-backward = [];
      switch-panels = [];
      switch-panels-backward = [];
      switch-to-workspace-down = [];
      switch-to-workspace-last = [];
      switch-to-workspace-left = [];
      switch-to-workspace-right = [];
      switch-to-workspace-up = [];
      switch-windows = [];
      switch-windows-backward = [];
      toggle-above = [];
      toggle-fullscreen = [];
      toggle-maximized = [];
      toggle-on-all-workspaces = [];
      unmaximize = [];

      
      



  };  
}