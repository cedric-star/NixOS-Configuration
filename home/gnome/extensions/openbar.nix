{ config, pkgs, lib, ... }:

let #funktionieeeert!!!
  # Funktion zur Konvertierung von Hex zu RGB (0-1)
hexToRgbStrings = hex:
  let
    cleanHex = lib.removePrefix "#" hex;
    hexToInt = s:
      let 
        chars = lib.stringToCharacters (lib.toLower s);
        toDecimal = c:
          if c == "a" then 10
          else if c == "b" then 11
          else if c == "c" then 12
          else if c == "d" then 13
          else if c == "e" then 14
          else if c == "f" then 15
          else lib.toInt c;
      in
        (toDecimal (lib.elemAt chars 0)) * 16 + (toDecimal (lib.elemAt chars 1));
    
    r = hexToInt (builtins.substring 0 2 cleanHex);
    g = hexToInt (builtins.substring 2 2 cleanHex);
    b = hexToInt (builtins.substring 4 2 cleanHex);
    
    # Auf 3 Nachkommastellen formatieren (ohne führende Nullen Problem)
    formatFloat = x: 
      let 
        scaled = builtins.floor (x * 1000 + 0.5);
        rounded = scaled / 1000.0;
        str = toString rounded;
        parts = lib.splitString "." str;
      in
        if lib.length parts == 1 then
          str + ".000"
        else
          let 
            integer = lib.elemAt parts 0;
            decimal = lib.elemAt parts 1;
            # Vermeide toInt für führende Nullen
            paddedDecimal = 
              if lib.stringLength decimal >= 3 then
                lib.substring 0 3 decimal
              else
                decimal + (lib.substring 0 (3 - (lib.stringLength decimal)) "000");
          in
            integer + "." + paddedDecimal;
  in [
    (formatFloat (r / 255.0))
    (formatFloat (g / 255.0))
    (formatFloat (b / 255.0))
  ];
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
      candybar = true;
      candy1 = hexToRgbStrings stylixColors.base00;
      candy2 = hexToRgbStrings stylixColors.base00;
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

      #mscolor = ; #farbe von gedrückten buttons
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