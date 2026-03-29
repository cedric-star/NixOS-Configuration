{ config, pkgs, inputs, ...}: 

{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  environment.systemPackages = with pkgs; [
    noctalia-shell
### System Tools
    #neofetch                    # logo anzeigen    
    wget                        # repos remote
    htop                        # systemressourcen anzeigen
    home-manager                # home Konfigurationen 
    kitty                       # Terminal Emulator
    alac
    fish                        # geile Shell
    wine
    sass
    pywal
    imagemagick
    bibata-cursors
    lyra-cursors
    i3
    woeusb-ng
    ntfs3g
    xone-dongle-firmware
    blueman
    fuzzel
    alacritty
    networkmanager
    cmatrix
    wlogout
    qgis-ltr

### Compiler ###                
    swi-prolog                  # prolog
    gcc                         # c lang
    glibc.dev                   # c header
    stdenv.cc.libc              # c libraries
    raylib
    openjdk21
    jetbrains.jdk
    python3
    fastfetch
    #ventoy
    parted
    gparted
    ncurses
    ollama
    sl
    flatpak
    zip
    unzip
    zoom-us
    syncthing
    libqalculate
    tailscale
    kid3

### Code Editoren ###
    vscodium                    # codium
    #vscode                     # nur für copilot (brauch ich doch eigntlich nicht hihi)
    vim                         # vim halt
    neovim                      # nvim halt


### IDE's ###
    jetbrains.webstorm
    jetbrains.idea-oss
    jetbrains.pycharm-oss
    jetbrains.clion
    jetbrains.datagrip
    arduino-ide

### Kommunikations ###
    discord
    #signal-desktop
    karere                      #whatsie #qtengine problem


### Dev Tools ###
    git
    nodejs_24
    ihaskell
    docker
    docker-compose
    postgresql
    insomnia
    
### Multimedia ###
    lmms
    spotify
    gimp
    hypnotix                    # tv streaming               
    blender
    davinci-resolve


### inf programme ###
    gftp
    gns3-gui
    kicad
    virtualbox
    virt-manager
    dosbox
    dosbox-x
    notes
#    wineWowPackages.stable # oder wineWowPackages.wayland für wine
    eduvpn-client


### Spiele/Launcher ###
    steam
    steam-run                   # nötig für steam (RE)
    protonup-ng                 # proton GE in compatibility für ein spiel auswählen
    mangohud                    # overlay mit fps, ...
    prism                       # minecraft
    heroic                      # epic games
    prismlauncher
    #nexusmods-app # outdated
    antimicrox
    noctalia-qs
  ];

  # Install firefox.
  programs.firefox.enable = true;
  programs.steam.enable = true;
  #programs.noctalia-shell.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
