{ config, pkgs, ...}:

{
  boot.loader.systemd-boot.enable = false;
  
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";  # Wichtig für EFI-Installation!
    # useOSProber = true;  # Optional: falls du andere OS hast
  };
  
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };
}
