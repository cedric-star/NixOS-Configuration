{
  config,
  pkgs,
  inputs,
  ...
}:

{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  environment.systemPackages = with pkgs; [
    noctalia-shell
    ### System Tools
    #neofetch                    # logo anzeigen
    wget # repos remote
    htop # systemressourcen anzeigen
    home-manager # home Konfigurationen
    kitty # Terminal Emulator
    alac
    fish # geile Shell
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
    pkgsStable.qgis-ltr # kaputte dependencies
    gtksourceview
    brightnessctl # für helligkeits regulierung mit f tasten
    wallust
    imagemagick # für Formatkonvertierung falls nötig
    matugen
    pywal
    efibootmgr

    ### Compiler ###
    swi-prolog # prolog
    gcc # c lang
    glibc.dev # c header
    stdenv.cc.libc # c libraries
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
    libreoffice

    ### Code Editoren ###
    bat
    vscodium # codium
    vim # vim halt
    #neovim                      # nvim halt durch flake da
    zed-editor-fhs

    ### IDE's ###
    jetbrains.webstorm
    jetbrains.idea-oss
    jetbrains.pycharm-oss
    jetbrains.datagrip
    arduino-ide

    ### Kommunikations ###
    discord
    vesktop
    signal-desktop
    karere # whatsie #qtengine problem

    ### Dev Tools ###
    git
    nodejs_24
    ihaskell
    docker
    docker-compose
    postgresql
    insomnia
    uv

    ### Multimedia ###
    lmms
    spotify
    gimp
    hypnotix # tv streaming
    blender
    davinci-resolve
    chromium
    wdisplays
    cliphist
    vlc
    inkscape
    nwg-displays

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
    appimage-run
    cheese
    yazi
    btop

    ### Spiele/Launcher ###
    #steam
    steam-run # nötig für steam (RE)
    protonup-ng # proton GE in compatibility für ein spiel auswählen
    mangohud # overlay mit fps, ...
    prism # minecraft
    heroic # epic games
    prismlauncher
    antimicrox
    noctalia-qs

    ### Gaming Software ###
    mesa-demos # für glxinfo command
    vulkan-tools # für vulkaninfo | grep command
    clinfo # um opencl funktionalitäten zu prüfen (für blender)

    ### Gnome
    nautilus # File Manager
    gnome-keyring
    gnome-online-accounts # GOA-Einstellungspanel
    seahorse # Keyring-GUI (optional aber praktisch)
    gnome-calendar # Kalender
    gnome-contacts # Kontakte
    evolution # Mail + Kalender (vollständig)
    geary # leichterer Mail-Client
    gnome-control-center # Einstellungen (Accounts, WLAN, …)
    polkit_gnome # Polkit-Authentifizierungsagent
    gnome-notes
    gnome-boxes
    baobab # disk analyzer
    gnome-photos
    eog

    inputs.ap-visual-sorting.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  # Install firefox.
  programs.firefox.enable = true;
  #programs.noctalia-shell.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

}
