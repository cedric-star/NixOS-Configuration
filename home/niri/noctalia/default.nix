{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  # Plugin-Dateien ins richtige Verzeichnis symlinken
  home.file.".config/noctalia/plugins/nvim-cheatsheet" = {
    source = ./nvim-cheatsheet;
    recursive = true;
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

    settings = (builtins.fromJSON (builtins.readFile ./noctalia.json));
  };
}

