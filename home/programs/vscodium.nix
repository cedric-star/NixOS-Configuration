{ config, lib, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

  profiles.default.extensions = with pkgs.vscode-extensions; [
# hier identifier in extension eintragen
      vscjava.vscode-java-pack              #java
      ms-vscode.cpptools-extension-pack     #c/c++
      myriad-dreamin.tinymist               #typst
      haskell.haskell                       #haskell
      jnoortheen.nix-ide                    #nix
      jebbs.plantuml                        #puml
      mechatroner.rainbow-csv               #csv
      ms-toolsai.jupyter                    #jupyter
      ms-python.python                      #python
      #kdl-org.kdl-v1
    ];
  };
}
