{ config, pkgs, ...}:

{
  boot.loader.systemd-boot.enable = false;
  
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";  # Wichtig für EFI-Installation!
    #theme = pkgs.fetchFromGitHub {
    #  owner =  "shvchk";
    #  repo = "fallout-grub-theme";
    #  rev = "master";
    #  sha256 = "iQU1Rv7Q0BFdsIX9c7mxDhhYaWemuaNRYs+sR1DF0Rc=";
    #  # um hahs herauszufinden: fehlerhaften eintragen, rebuilden, aus fehlermeldug kopieren
    #};
  };
  
  boot.loader.efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot";
  };

  #boot.loader.systemd-boot.configurationLimit = 8;
}
