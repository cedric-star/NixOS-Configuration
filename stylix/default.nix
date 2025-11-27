{ pkgs, lib, config, inputs, ... }:

let 
  myCursor = pkgs.fetchFromGitHub {
    owner = "ful1e5";
    repo = "Bibata_Cursor";
    rev = "main";
    sha256 = "kIKidw1vditpuxO1gVuZeUPdWBzkiksO/q2R/+DUdEc=";

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

  stylix.cursor = {
    package = myCursor;
    name = "Bibata Original Classic";
    size = 24;
  };

}


