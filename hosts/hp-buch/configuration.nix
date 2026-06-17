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

  networking.hostName = "hp-buch";
  system.stateVersion = "25.05";

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

}
