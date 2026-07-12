{ config, pkgs, ...}:

{
  boot.loader.systemd-boot.enable = false; # vorher true
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    devices = [ "nodev" ];
    useOSProber = true; # findet win11 bootmanager
    theme = pkgs.fetchFromGitHub {
      owner =  "shvchk";
      repo = "fallout-grub-theme";
      rev = "master";
      sha256 = "dNRLM9tQjWOyi3s4Q2er5Xn2bpG/yQ/D/+F/lfYXrs8=";
      # um hahs herauszufinden: fehlerhaften eintragen, rebuilden, aus fehlermeldug kopieren
    };
    timeoutStyle = "menu";   # erzwingt sichtbares Menü
    splashMode = "normal";   # kein Boot-Splash statt Menü
  };
  boot.loader.timeout = null;
}
