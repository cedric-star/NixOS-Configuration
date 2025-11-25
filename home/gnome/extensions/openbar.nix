{ config, pkgs, ... }:

let 
  stylixColors = config.lib.stylix.colors;
in 

{

  dconf.settings = {
    "org/gnome/shell/extensions/openbar" = {

### panel
      autofg-bar = false;
      bgalpha = 0.0;
      bradius = 20;
      bwidth = 0.0;

      ### über candy items drüber hovern/anklicken
      halpha = 0.55;
      #hcolor = bg1;
      #dark-hcolor = bg1;
      reloadstyle = false;
      trigger-reload = false;


### candybar: in panel um jedes item ellipse
      candyalpha = 0.72;
      candybar = false;
      candy1 = stylixColors.base00;
      candy2 = stylixColors.base00;
      candy3 = stylixColors.base00;
      candy4 = stylixColors.base00;
      candy5 = stylixColors.base00;
      candy6 = stylixColors.base00;
      dark-candy1 = stylixColors.base00;
      dark-candy2 = stylixColors.base00;
      dark-candy3 = stylixColors.base00;
      dark-candy4 = stylixColors.base00;
      dark-candy5 = stylixColors.base00;
      dark-candy6 = stylixColors.base00;

### schrift
      fgalpha = 0.85;
      #fgcolor = fg0; # schriftfarbe in panel
      #dark-fgcolor = fg0;

      #mfgcolor = fg0; # scriftfarbe in gnome boxen
      #dark-mfgcolor = fg0;
      #font = "Adwaita Mono Bold 13";

      height = 30;
      margin = 0.2;
      bmargin = 0.2;
      hpad = 4.5;
      vpad = 2.3;


### hintergründ
      mbgalpha = 0.55; #hintergrund transparent
      #mbgcolor = bg0;  # allgemeine hintergrundfarbe
      #dark-mbgcolor = bg0;
  

### buttons
      #mhcolor = bg1; # über buttons hovern
      #dark-mhcolor = bg1;
      mhalpha = 0.10;

      #mscolor = bg2; #farbe von gedrückten buttons
      msalpha = 0.55;


      disize = 60; #icon größe dashdock



      ### farben auf alles anwenden
      apply-accent-shell = false;
      apply-all-shell = false;
      apply-menu-notif = false;
      apply-menu-shell = false;

      ### styles löschen (clean machen)
      neon = false;

      menustyle = true; #farben nicht überschreiben

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