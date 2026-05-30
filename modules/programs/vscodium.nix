{ config, lib, pkgs, ... }:


{
  environment.systemPackages = with pkgs; [
  (vscode-with-extensions.override {
    vscode = vscodium;
    vscodeExtensions = with vscode-extensions; [
      bbenoist.nix
      ms-azuretools.vscode-docker
      ms-vscode-remote.remote-ssh
      vscjava.vscode-java-pack              #java
      ms-vscode.cpptools-extension-pack     #c/c++
      myriad-dreamin.tinymist               #typst
      haskell.haskell                       #haskell
      jnoortheen.nix-ide                    #nix
      jebbs.plantuml                        #puml
      mechatroner.rainbow-csv               #csv
      ms-toolsai.jupyter                    #jupyter
      ms-python.python                      #python
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "remote-ssh-edit";
        publisher = "ms-vscode-remote";
        version = "0.47.2";
        sha256 = "1hp6gjh4xp2m1xlm1jsdzxw9d8frkiidhph6nvl24d0h8z34w49g";
      }
      {
        name = "noctaliatheme";
        publisher = "Noctalia";
        version = "0.0.5";
        sha256 = "sha256-aTSk3yYkBw5GrD0CbRL2wo3SlBffzBTDe1pZoZa1URQ=";
        }
    ];
  })
];
  
}

