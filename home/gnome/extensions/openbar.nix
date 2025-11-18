{ config, pkgs, ... }:

let 
  bg0 = ["0.361" "0.047" "0.098"];  #hintergrund: Dunkles Weinrot;     
  bg1 = ["1.000" "0.835" "0.587"]; #gehovert so gild gelb beige
  bg2 = ["0.882" "0.463" "0.714"];

  fg0 = ["0.871" "0.867" "0.855"];  # hellgrau (fast weiß)
in 

{

  dconf.settings = {
    "org/gnome/shell/extensions/openbar" = {
      autofg-bar = false;
      bgalpha = 0.0;
      bradius = 20;
      bwidth = 0.0;

### candybar: in panel um jedes item ellipse
      candyalpha = 0.72;
      candybar = true;
      candy1 = bg0;
      candy2 = bg0;
      candy3 = bg0;
      candy4 = bg0;
      candy5 = bg0;
      candy6 = bg0;
      dark-candy1 = bg0;
      dark-candy2 = bg0;
      dark-candy3 = bg0;
      dark-candy4 = bg0;
      dark-candy5 = bg0;
      dark-candy6 = bg0;

### schrift
      fgcolor = fg0; # schriftfarbe in panel
      dark-fgcolor = fg0;

      mfgcolor = fg0; # scriftfarbe in gnome boxen
      dark-mfgcolor = fg0;

      font = "Adwaita Mono Bold 13";

      height = 30;
      margin = 0.2;
      bmargin = 0.2;
      hpad = 4.5;
      vpad = 2.3;




### hintergründ
      mbgalpha = 0.55; #hintergrund transparent
      mbgcolor = bg0;  # allgemeine hintergrundfarbe
      dark-mbgcolor = bg0;
  

### buttons
      mhcolor = bg1; # über buttons hovern
      dark-mhcolor = bg1;
      mhalpha = 0.10;

      mscolor = bg2; #farbe von gedrückten buttons
      msalpha = 0.55;


      disize = 60; #icon größe dashdock



      ### farben auf alles anwenden
      apply-accent-shell = true;
      apply-all-shell = true;
      apply-menu-notif = true;
      apply-menu-shell = true;

      ### styles löschen (clean machen)
      neon = false;

      menustyle = true;

      mbalpha = 0.0; #linien umrandung um fenster entfernen
      dark-mbalpha = 0.0;
      
      autohg-menu = false; #für custom farbe beim hovern
      mshalpha = 0.0; #shadow hinter hintergrundfarbe wegmachen


      dashdock-style = "Custom";
      dbgalpha = 0.0; #hintergrundtransparenz dashdock
      dborder = false; # border dash dock 
      dshadow = false;
    };

  };
}