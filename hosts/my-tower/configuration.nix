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

  # Intel Grafik / OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # optional: bessere Video-Beschleunigung
  environment.systemPackages = with pkgs; [
    intel-media-driver
    intel-gpu-tools
    mesa-demos
    vulkan-tools
  ];

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
