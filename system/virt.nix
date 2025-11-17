{ config, pkgs, ...}:

{
    virtualisation.docker.enable = true;

    virtualisation.virtualbox.host = {
        enable = true;

    };

    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
}