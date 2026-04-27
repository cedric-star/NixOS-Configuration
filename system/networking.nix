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
    settings = {
      General = {
        # ✅ Entfernt: Enable = "Source,Sink,Media,Socket";
        Experimental = true;
        FastConnectable = true;
        ControllerMode = "dual";
        # ✅ Optional: Erhöht das Scan-Intervall für schnellere Erkennung
        DiscoverableTimeout = 0;
        # ✅ Optional: Minimum und Maximum für Verbindungsparameter
        MinConnectionInterval = 6;
        MaxConnectionInterval = 9;
      };
      Policy = {
        AutoEnable = true;
        ReconnectAttempts = 7;
        # ✅ Neue nützliche Policy: Automatisches Reconnect aktivieren
        AutoConnect = true;
      };
    };
  };

  # ✅ Kernel-Module
  boot.kernelModules = [ "btusb" "bluetooth" ];

  # ✅ WLAN/Bluetooth Koexistenz
  boot.extraModprobeConfig = ''
    options iwlwifi bt_coex_active=0
    options iwlwifi power_save=0
    # ✅ USB Autosuspend deaktivieren (kann das Scannen beschleunigen)
    options usbcore autosuspend=-1
  '';


  # NUR EINEN VON BEIDEN AKTIVIEREN:
  # Entferne eine der beiden Zeilen:
  
  # Für Xbox One/Series Controller:
  hardware.xpadneo.enable = false;
  
  # ODER für ältere Xbox Controller:
  # hardware.xone.enable = true;

  services.tailscale.enable = false;
  services.blueman.enable = true;
}