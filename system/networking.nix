{ config, pkgs, ...}:

{
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

    hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    
    # WICHTIG: Nur EINEN Xbox-Treiber aktivieren, nicht beide!
    # Entweder xpadneo ODER xone, nicht beides!
    
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
        FastConnectable = true;
        # Diese Zeile hinzufügen:
        ControllerMode = "bredr";
      };
      Policy = {
        AutoEnable = true;
        # Diese Zeile hinzufügen:
        ReconnectAttempts = 7;
      };
    };
  };
  
  # NUR EINEN VON BEIDEN AKTIVIEREN:
  # Entferne eine der beiden Zeilen:
  
  # Für Xbox One/Series Controller:
  hardware.xpadneo.enable = true;
  
  # ODER für ältere Xbox Controller:
  # hardware.xone.enable = true;

  services.tailscale.enable = true;
}