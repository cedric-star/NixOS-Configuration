{ config, pkgs, ... }:

let 
  my-theme = pkgs.stdenv.mkDerivation {
    name = "my-theme";
    pane = "my-theme";
    verison = "1.0";
    src = ./my-theme.css;

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/share/themes/my-theme/gnome-shell
      cp $src $out/share/themes/my-theme/gnome-shell/gnome-shell.css
    '';
  };
in {
  home.packages = [ my-theme ];
  dconf.settings = {
    "org/gnome/shell/extensions/user-theme" = {
      name = "my-theme";
    };
  };
}