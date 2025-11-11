{ config, pkgs, ...}:

{
  time.timeZone = "Europe/Berlin";

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
  
  services.xserver = {
    enable = true;
    
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    xkb = {
      layout = "de";
      variant = "";
    };
  };

  console.keyMap = "de";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };



  users.users.cedric = {
    isNormalUser = true;
    description = "cedric";
    extraGroups = [ "networkmanager" "wheel" "input"];
    packages = with pkgs; [
    ];
  };

  system.stateVersion = "25.05"; 
}