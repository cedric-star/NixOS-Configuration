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
        #{ unique id = publisher.name
        #  name      = "remote-ssh-edit";
        #  publisher = "ms-vscode-remote";
        #  version   = "0.47.2";
        #  sha256    = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
        #}
      ];

    
    };
  };
}
