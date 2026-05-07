{ config, pkgs, lib, ...}:

{
  services.libinput.enable = true;
  services.touchegg.enable = true;
  
  programs.niri.enable = true;


  services = {
 
    desktopManager.gnome.enable = false;
    
    displayManager.ly = {
      enable = true;
      #wayland.enable = true;
    };
    #xkb = {
    #  layout = "de";
    #  variant = "";
    #};
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  programs.fish.enable = true;
  users.users.cedric = {
    isNormalUser = true;
    description = "cedric";
    extraGroups = [ "disk" "networkmanager" "wheel" "input" "docker" "vboxusers" "dialout"];
    shell = pkgs.fish;
  };

  programs.nix-ld.enable = true;

  system.stateVersion = "25.05";
  #nixpkgs.config.permittedInsecurePackages = [ "qtwebengine-5.15.19" ];

    # Ermöglicht die sichere Speicherung von Passwörtern (wird für Gmail benötigt)
  services.gnome = {
    gnome-keyring.enable = true;
    gnome-online-accounts.enable = true;
    evolution-data-server.enable = true;
    tracker-miners.enable = true;
    tracker.enable = true;
  };
  

  security.pam.services.login.enableGnomeKeyring = true;
  
  # GVFS – nötig für Nautilus (Netzlaufwerke, Papierkorb, MTP …)
  services.gvfs.enable = true;

  # Tumbler – Thumbnail-Dienst für Nautilus
  services.tumbler.enable = true;


  

  # Polkit wird oft für Berechtigungsdialoge benötigt
  security.polkit.enable = true;


}
