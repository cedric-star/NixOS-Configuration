{ config, lib, pkgs, ... }:


{
  programs.vscodium = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = false;

      extensions = with pkgs.vscode-extensions; [
        vscjava.vscode-java-pack              #java
        ms-vscode.cpptools-extension-pack     #c/c++
        myriad-dreamin.tinymist               #typst
        haskell.haskell                       #haskell
        jnoortheen.nix-ide                    #nix
        jebbs.plantuml                        #puml
        mechatroner.rainbow-csv               #csv
        ms-toolsai.jupyter                    #jupyter
        ms-python.python                      #python
      ];

      userSettings = {
        "files.autoSave" = "on";
      };
    };
  };

  stylix.targets.vscode.enable = true;
}

