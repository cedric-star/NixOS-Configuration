{ config, pkgs, ... }:

let 
  mydatatest = false;
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

      reloadstyle = false;
      trigger-reload = false;


### candybar: in panel um jedes item ellipse
      candyalpha = 0.72;
      candybar = true;


### schrift
      fgalpha = 0.85;# schriftfarbe in panel

      font = "Adwaita Mono Bold 13";

      height = 30;
      margin = 0.2;
      bmargin = 0.2;
      hpad = 4.5;
      vpad = 2.3;



### hintergründ
      mbgalpha = 0.55; #hintergrund transparent
  

### buttons
     
      mhalpha = 0.10; #hover über buttons

      msalpha = 0.55; #farbe von gedrückten buttons transparent


      disize = 60; #icon größe dashdock



      ### farben auf alles anwenden
      apply-accent-shell = false;
      apply-all-shell = false;
      apply-menu-notif = false;
      apply-menu-shell = false;

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