{
  config,
  pkgs,
  inputs,
  ...
}:

let 
  noctaliaSettings =
    (builtins.fromJSON (builtins.readFile ./noctalia.json))
    // {
      wallpaper =
        ((builtins.fromJSON (builtins.readFile ./noctalia.json)).wallpaper or { })
        // {
          directory =
            "${config.home.homeDirectory}/NixOS-Configuration/modules/theming/backgrounds";
        };
    };
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # Plugin-Dateien ins richtige Verzeichnis symlinken
  home.file.".config/noctalia/plugins/nvim-cheatsheet" = {
    source = ./nvim-cheatsheet;
    recursive = true;
  };

  #für steam theming
  home.file.".steam/steam/millennium/themes/Material-Theme/css/main/colors/matugen.css" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.steam/steam/steamui/skins/Material-Theme/css/main/colors/matugen.css";
  };

  programs.noctalia-shell = {
    enable = true;

    # Plugin aktivieren
    plugins = {
      sources = [ ]; # keine externen Quellen nötig
      states = {
        nvim-cheatsheet = {
          enabled = true;
          sourceUrl = ""; # leer = lokales Plugin
        };
      };
      version = 2;
    };

    settings = noctaliaSettings;
  };
}

