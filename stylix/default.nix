{ pkgs, lib, config, inputs, ... }:

let 
  myCursor = pkgs.fetchFromGitHub {
    owner = "ful1e5";
    repo = "Bibata_Cursor";
    rev = "main";
    sha256 = "iQU1Rv7Q0BFdsIX9c7mxDhhYaWemuaNRYs+sR1DF0Rc=";

  };
in {
  stylix.enable = true;
  stylix.image = ./wallpapers/b1.png;
  stylix.base16Scheme = ./redpink.yaml;
  stylix.polarity = "dark";


  stylix.opacity = {
    applications = 0.85;
    terminal = 0.85;
    desktop = 0.85;
    popups = 0.85;
  };

  stylix.cursor.package = myCursor;
  stylix.cursor.name = "Bibata Original Classic";

}


