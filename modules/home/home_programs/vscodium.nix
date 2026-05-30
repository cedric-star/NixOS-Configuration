{ config, lib, pkgs, ... }:


{
  programs.vscodium = {
    enable = true;
    profiles.default = {
      enableExtensionUpdateCheck = true;
      enableUpdateCheck = false;

      extensions = (with pkgs.vscode-extensions; [
        vscjava.vscode-java-pack              #java
        ms-vscode.cpptools-extension-pack     #c/c++
        myriad-dreamin.tinymist               #typst
        haskell.haskell                       #haskell
        jnoortheen.nix-ide                    #nix
        jebbs.plantuml                        #puml
        mechatroner.rainbow-csv               #csv
        ms-toolsai.jupyter                    #jupyter
        ms-python.python                      #python
      ]) ++ (pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
          name = "noctaliatheme";
          publisher = "Noctalia";
          version = "0.0.5";
          sha256 = "sha256-aTSk3yYkBw5GrD0CbRL2wo3SlBffzBTDe1pZoZa1URQ=";
        }
      ]);

      userSettings = {
        "files.autoSave" = "on";
        "workbench.colorTheme" = "Noctalia";
      };
    };
  };
}

