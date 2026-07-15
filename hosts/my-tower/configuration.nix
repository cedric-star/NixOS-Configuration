{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ../../modules
  ];

  #boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;

  networking.hostName = "my-tower";
  system.stateVersion = "26.05";


### GAMING ###
  # Intel Grafik / OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = [ "amdgpu" ];

  # optional: bessere Video-Beschleunigung
  environment.systemPackages = with pkgs; [
    intel-media-driver
    intel-gpu-tools
    mesa-demos
    vulkan-tools

    mangohud
    pkgsStable.bottles # run games in a windows bottle
  ];
#################



  services.fprintd.enable = true;

  services = {
    displayManager.sddm = {
      enable = false;
      wayland.enable = true;
    };
  };

  #programs.greetd.enable = true;
 
  services.greetd = {
    enable = true;
    settings = {
      default_session.command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri";
      default_session.user = "greeter";
    };
  };

  environment.variables = {
    XDG_RUNTIME_DIR = "/run/user/$UID";
  };
}
