{ config, pkgs, ... }:

let 
  my-theme = pkgs.stdenv.mkDerivation {
    name = "my-theme";
    pane = "my-theme";
    verison = "1.0";
    src = ./my-theme.css;

    dontUnpack = true;
  };
in {
  home.packages = [ my-theme ];
  dconf.settings = {
    "org/gnome/shell/extensions/user-theme" = {
      name = "my-theme";
    };
  };
}