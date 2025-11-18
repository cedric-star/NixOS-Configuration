{ config, pkgs, ... }:


{
  dconf.settings = {
    "org/gnome/shell/extensions/openbar" = {
      autofg-bar = false;
      bgalpha = 0.0;
      bradius = 20;
      bwidth = 0.0;
      candy1 = ["0.361" "0.047" "0.098"];
      candy2 = ["0.361" "0.047" "0.098"];
      candy3 = ["0.361" "0.047" "0.098"];
      candy4 = ["0.361" "0.047" "0.098"];
      candy5 = ["0.361" "0.047" "0.098"];
      candy6 = ["0.361" "0.047" "0.098"];

      candyalpha = 0.5;
      candybar = true;

      dark-candy1 = ["0.361" "0.047" "0.098"];
      dark-candy2 = ["0.361" "0.047" "0.098"];
      dark-candy3 = ["0.361" "0.047" "0.098"];
      dark-candy4 = ["0.361" "0.047" "0.098"];
      dark-candy5 = ["0.361" "0.047" "0.098"];
      dark-candy6 = ["0.361" "0.047" "0.098"];

      fgcolor = ["0.871" "0.867" "0.855"];
      dark-fgcolor = ["0.871" "0.867" "0.855"];
      font = "Adwaita Mono Bold 13";

      height = 30;
      margin = 0.2;
      bmargin = 0.2;
      hpad = 4.5;
      vpad = 2.3;

      neon = false;

      ### menüs:
      menustyle = true;

      mbalpha = 0.0; #linien umrandung um fenster entfernen
      dakr-mbalpha = 0.0;

      mfgcolor = ["0.0" "0.0" "0.0"];#scriftfarbe
      dark-mfgcolor = ["0.0" "0.0" "0.0"];

      mbgcolor = ["0.361" "0.047" "0.098"];  # allgemeine hintergrundfarbe
      dark-mbgcolor = ["0.361" "0.047" "0.098"];
  
      mbgalpha = 0.55; #hintergrund transparent

      autohg-menu = false; #für custom farbe beim hovern
      dark-mhcolor = ["0.871" "0.867" "0.855"]; #über buttons hovern
      mhcolor = ["1.000" "0.835" "0.587"]; #über buttons hovern
      mhalpha = 0.55;

      mscolor = ["0.882" "0.463" "0.714"]; #farbe von gedrückten buttons
      msalpha = 0.55;

      mshalpha = 0.0; #shadow hinter hintergrundfarbe wegmachen

      dashdock-style = "Custom";
      dbgalpha = 0.0; #hintergrundtransparenz dashdock
      disize = 60; #icon größe dashdock
      dborder = false; # border dash dock 
      dshadow = false;


      ### weiteres
      apply-accent-shell = true;
      apply-all-shell = false;
      apply-menu-notif = true;
      apply-menu-shell = true;
    };

  };
}