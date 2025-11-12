{ config, pkgs, ...}:

{
  boot.loader.systemd-boot.enable = false;
  
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";  # Wichtig für EFI-Installation!
    theme = pkgs.fetchFromGitHub {
      owner =  "shvchk";
      repo = "fallout-grub-theme";
      rev = "master";
      sha256 = "0000000000000000000000000000000000000000000000000000";
    };
  };
  
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  #boot.loader.systemd-boot.configurationLimit = 8;
}
