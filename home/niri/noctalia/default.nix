{ config, pkgs, ... }:

{
  # 1. Quickshell Binary installieren (falls nicht schon global verfügbar)
  home.packages = [ pkgs.quickshell ];
  
  # 2. Die Config aus dem Paket in ~/.config/quickshell/ verlinken
  home.file.".config/quickshell/noctalia-shell" = {
    source = "${pkgs.noctalia-shell}/share/quickshell/noctalia-shell";
    recursive = true;
  };
}