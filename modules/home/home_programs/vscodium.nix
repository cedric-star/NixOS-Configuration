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
        {
          name      = "remote-ssh-edit";
          publisher = "ms-vscode-remote";
          version   = "0.47.2";
          sha256    = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
        }
        {
          name      = "noctaliatheme";
          publisher = "Noctalia";
          version   = "0.0.5";
          sha256    = "sha256-aTSk3yYkBw5GrD0CbRL2wo3SlBffzBTDe1pZoZa1URQ=";
        }
        # Pywal/Wallust Themes – werden von pywal zur Laufzeit beschrieben.
        # mutableExtensionsDir = true → Kopien in ~/.vscode-oss/extensions/, schreibbar
        {
          name      = "wallust-theme";
          publisher = "saatvik333";
          version   = "1.1.1";
          sha256    = "sha256-JUakVEviPrToyHIhrI54jYsp3k/9b2UgfSBswq5wLyU=";
        }
        {
          name      = "wal-theme";
          publisher = "dlasagno";
          version   = "1.1.2";
          sha256    = "sha256-vO9FjzA3+5VTgnBY12eawPCfDzKap07Tgf5jqz/IgN0=";
        }
      ];

    
    };
  };
}
