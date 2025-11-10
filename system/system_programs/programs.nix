{ config, pkgs, ...}: 

{
  environment.systemPackages = with pkgs; [
### System Tools
    neofetch                    # logo anzeigen    
    wget                        # repos remote
    htop                        # systemressourcen anzeigen
    home-manager                # home Konfigurationen 
    kitty                       # Terminal Emulator
    fish                        # geile Shell


### Compiler ###                
    swi-prolog                  # prolog
    gcc                         # c lang
    glibc.dev                   # c header
    stdenv.cc.libc              # c libraries
    openjdk21
    jetbrains.jdk


### Code Editoren ###
    vscodium                    # codium
    vscode                      # nur für copilot (brauch ich doch eigntlich nicht hihi)
    vim                         # vim halt
    neovim                      # nvim halt


### IDE's ###
    jetbrains.webstorm
    jetbrains.idea-community
    jetbrains.pycharm-community
    jetbrains.clion
    jetbrains.datagrip


### Kommunikations ###
    discord
    signal-desktop
    whatsie


### Dev Tools ###
    git
    nodejs_24
    ihaskell
    docker
    docker-compose

    
### Multimedia ###
    lmms
    spotify
    gimp


### inf programme ###
    gftp
    gns3-gui
    kicad
    virtualbox
    virt-manager
    dosbox
    dosbox-x
#    wineWowPackages.stable # oder wineWowPackages.wayland für wine
    eduvpn-client


### Spiele/Launcher ###
    steam
    steam-run
    protonup
    prism#minecraft
    heroic #epic games
  ];

  # Install firefox.
  programs.firefox.enable = true;
  programs.steam.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}