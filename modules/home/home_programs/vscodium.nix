{ config, lib, pkgs, ... }:

{
  programs.vscodium = {
    enable = true;
    mutableExtensionsDir = true;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        # Nix
        bbenoist.nix
        jnoortheen.nix-ide
        # Container / Remote
        ms-azuretools.vscode-docker
        ms-vscode-remote.remote-ssh
        # Sprachen
        vscjava.vscode-java-pack
        ms-vscode.cpptools-extension-pack
        myriad-dreamin.tinymist       # Typst
        haskell.haskell
        jebbs.plantuml
        mechatroner.rainbow-csv
        ms-toolsai.jupyter
        ms-python.python
      ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # unique id = publisher.name
        { 
          name      = "qt-qml";
          publisher = "theqtcompany";
          version   = "1.14.0";
          sha256    = "5Hx9Y73osV3Kd795q4i8sQWTtecRlM0YNxwMJQQ8nxE=";
        }
        {
          name      = "kdl";
          publisher = "kdl-org";
          version   = "2.1.3";
          sha256    = "Jssmb5owrgNWlmLFSKCgqMJKp3sPpOrlEUBwzZSSpbM=";
        }
      ];

    
    };
  };
}
