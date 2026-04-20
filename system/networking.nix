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
        Enable = "Source,Sink,Media,Socket";
        Experimental = true;
        FastConnectable = true;
        ControllerMode = "bredr";         # ✅ You already have this
      };
      Policy = {
        AutoEnable = true;
        ReconnectAttempts = 7;            # ✅ You already have this
      };
      # ✅ NEW: Force active LE scanning (helps with device discovery)
      LE = {
        EnableAdvMonInterleaveScan = "1"; # Crucial for slow scans
      };
    };
  };

  # ✅ NEW: Force-load Bluetooth kernel modules at boot
  boot.kernelModules = [ "btusb" "bluetooth" ];

  # ✅ NEW: Extra Wi-Fi/Bluetooth coexistence parameters (especially for Intel cards)
  boot.extraModprobeConfig = ''
    # Keep Bluetooth coexistence disabled for better BT scan performance
    options iwlwifi bt_coex_active=0
    # Disable power saving on Wi-Fi to reduce radio interference
    options iwlwifi power_save=0
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