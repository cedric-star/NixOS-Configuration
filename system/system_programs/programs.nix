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
    nautilus
    gtksourceview
    
    
### Compiler ###                
    swi-prolog                  # prolog
    gcc                         # c lang
    glibc.dev                   # c header
    stdenv.cc.libc              # c libraries
    gnumake
    raylib
    openjdk21
    jetbrains.jdk
    python3
    fastfetch
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
    gnome-calculator

### Code Editoren ###
    vscodium                    # codium
    vim                         # vim halt
    neovim                      # nvim halt


### IDE's ###
    jetbrains.webstorm
    jetbrains.idea-oss
    jetbrains.pycharm-oss
    jetbrains.datagrip
    arduino-ide

### Kommunikations ###
    discord
    signal-desktop
    karere                      #whatsie #qtengine problem
    gnome-calendar
    gnome-notes
    gnome-boxes
    geary
    gnome-online-accounts
    polkit_gnome

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
    chromium
    wdisplays
    cliphist
    #inkscape

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
    node-red
    mosquitto
    nmap
    

### Spiele/Launcher ###
    steam
    steam-run                   # nötig für steam (RE)
    protonup-ng                 # proton GE in compatibility für ein spiel auswählen
    mangohud                    # overlay mit fps, ...
    prism                       # minecraft
    heroic                      # epic games
    prismlauncher
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
