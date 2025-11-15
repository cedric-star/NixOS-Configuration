{ config, pkgs, ... }:

{
  dconf.settings = {
    "org/gnome/shell/extensions/openbar" = {
      autofg-bar = false;
      bgalpha = 0.0;
      bradius = 20;
      bwidth = 0.0;
      candy1 = ["1.000" "0.000" "0.561"];
      candy2 = ["1.000" "0.000" "0.561"];
      candy3 = ["1.000" "0.000" "0.561"];
      candy4 = ["1.000" "0.000" "0.561"];
      candy5 = ["1.000" "0.000" "0.561"];
      candy6 = ["1.000" "0.000" "0.561"];

      candyalpha = 0.5;
      candybar = true;

      dark-candy1 = ["1.000" "0.000" "0.561"];
      dark-candy2 = ["1.000" "0.000" "0.561"];
      dark-candy3 = ["1.000" "0.000" "0.561"];
      dark-candy4 = ["1.000" "0.000" "0.561"];
      dark-candy5 = ["1.000" "0.000" "0.561"];
      dark-candy6 = ["1.000" "0.000" "0.561"];

      fgcolor = ["0.0" "0.0" "0.0"];
      dark-fgcolor = ["0.0" "0.0" "0.0"];
      font = "Adwaita Mono Bold 13";

      height = 30;
      margin = 0.2;
      bmargin = 0.2;
      hpad = 2.3;
      vpad = 2.3;

      neon = false;

      ### menüs:
      menustyle = true;

      mfgcolor = ["0.0" "0.0" "0.0"];
      dark-mfgcolor = ["0.0" "0.0" "0.0"];

      mbgcolor = ["0.361" "0.047" "0.098"];  # 5C0C19 normalisiert
      dark-mbgcolor = ["0.361" "0.047" "0.098"];
      
      # Menu Shadow
      menushadowcolor = ["0.537" "0.078" "0.227"];  # 89143A normalisiert
      dark-menushadowcolor = ["0.537" "0.078" "0.227"];
      menushadowalpha = 0.45;
      dark-menushadowalpha = 0.45;
      
      # Menu Radius
      menupanelradius = 21;
      calendarsubsradius = 8;
      
      # Menu Alpha Values
      mfgalpha = 1.0;
      dark-mfgalpha = 1.0;
      mbgalpha = 1.0;
      dark-mbgalpha = 1.0;
      
      # Menu Highlight
      menuhighlightcolor = ["0.871" "0.867" "0.855"];  # DEDDDA normalisiert
      dark-menuhighlightcolor = ["0.871" "0.867" "0.855"];
      
      # Menu Border
      menuborderalpha = 0.0;
      dark-menuborderalpha = 0.0;
      
      # Menu Accent
      menuaccentcolor = ["0.882" "0.463" "0.714"];  # E176B6 normalisiert
      dark-menuaccentcolor = ["0.882" "0.463" "0.714"];
      menuaccentalpha = 0.45;
      dark-menuaccentalpha = 0.45;
    };

  };
}