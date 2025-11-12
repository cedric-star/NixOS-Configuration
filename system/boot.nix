{ config, pkgs, ...}:

{
  boot.loader.systemd-boot.enable = false;
  
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";  # Wichtig für EFI-Installation!
  };
  
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  boot.loader.systemd-boot.configurationLimit = 20;
}
