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

      fgcolor = ["0.122" "0.106" "0.106"];
      font = "Adwaita Mono Bold 10";

      height = 30;
      margin = 0;
      hpad = 2.3;
      vpad = 2.3;

      neon = false;
      
    };
  };
}