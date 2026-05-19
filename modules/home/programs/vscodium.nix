{ config, lib, pkgs, ... }:


{
  programs.vscodium = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = false;

      extensions = [
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
  };
}

