{ config, pkgs, ...}:

{
    # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
  };


  services.libinput.enable = true;
  services.touchegg.enable = true;
  # Enable the X11 windowing system.


  
  services.xserver = {
    enable = true;
    
    # Enable the GNOME Desktop Environment.
    desktopManager.gnome.enable = true;
    displayManager.gdm = { #anstatt gdm
      enable = true;
      wayland = true;
    };
    # Configure keymap in X11
    xkb = {
      layout = "de";
      variant = "";
    };
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cedric = {
    isNormalUser = true;
    description = "cedric";
    extraGroups = [ "networkmanager" "wheel" "input"];
    packages = with pkgs; [
    #  thunderbird
    ];
  };




  programs.dconf.enable = true;

  programs.dconf.settings = {
    "org/gnome/login-screen" = {
      banner-message-enable = true;
      banner-message-text = "Willkommen!";

      # Hintergrundbild
      background = "file:///etc/gdm/background.jpg";
    };
  };

  # Bild bereitstellen
  environment.etc."gdm/background.jpg".source = ./home/gnome/b2.png;










  system.stateVersion = "25.05"; 
}