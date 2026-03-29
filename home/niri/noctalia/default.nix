{ pkgs, inputs, ... }:

{
  programs.noctalia-shell = {
    enable = true;
  }

  programs.quickshell.enable = true;
}
