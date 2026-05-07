{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = false;
    package = pkgs.vscodium;

    haskell = {
      enable = true;
      hie.enable = true;
    };

    #profiles.default.extensions = with pkgs.vscode-extensions; [
    extensions = [
  # hier identifier in extension eintragen
      #vscjava.vscode-java-pack              #java
      #ms-vscode.cpptools-extension-pack     #c/c++
      #myriad-dreamin.tinymist               #typst
      #haskell.haskell                       #haskell
      #jnoortheen.nix-ide                    #nix
      #jebbs.plantuml                        #puml
      #mechatroner.rainbow-csv               #csv
      #ms-toolsai.jupyter                    #jupyter
      #ms-python.python                      #python
      #theqtcompany.qt-qml
      #kdl-org.kdl-v1
    ];

    userSettings = {
      "files.autoSave" = "on";
    };
  };




}

