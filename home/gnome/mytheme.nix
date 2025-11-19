{ config, pkgs, ... }:

let 
  my-theme = pkgs.stdenv.mkDerivation {
    pane = "my-theme";
    verison = "1.0";
    src = ./my-theme.css;
  };
in {
  home.packages = [ my-theme ];
  dconf.settings = {
    "org/gnome/shell/extensions/user-theme" = {
      name = "my-theme";
    };
  };
}