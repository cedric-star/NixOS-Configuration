{ config, pkgs, ... }:

let 
  my-theme = pkgs.stdenv.mkDerivation {
    name = "my-theme";
    pane = "my-theme";
    verison = "1.0";
    src = ./themes/pink_clean;

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out/share/themes/my-theme

      # Alle Dateien kopieren, inkl. SCSS
      cp -r $src/* $out/share/themes/my-theme/

      # Optional: SCSS entfernen
      rm "$out/share/themes/my-theme/gnome-shell.scss"
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