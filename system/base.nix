{ config, pkgs, lib, ...}:

{
  services.libinput.enable = true;
  services.touchegg.enable = true;
  
  services = {
 
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
      enable = true;
      wayland = true;
    };
    #xkb = {
    #  layout = "de";
    #  variant = "";
    #};
  };

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

  programs.fish.enable = true;
  users.users.cedric = {
    isNormalUser = true;
    description = "cedric";
    extraGroups = [ "networkmanager" "wheel" "input" "docker" "vboxusers"];
    shell = pkgs.fish;
  };

  programs.nix-ld.enable = true;

  system.stateVersion = "25.05";