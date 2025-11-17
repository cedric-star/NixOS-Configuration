{ config, pkgs, ...}:

{
    virtualisation.docker.enable = true;

    virtualisation.virtualbox.host = {
        enable = true;
        package = pkgs.virtualbox;

    };

    programs.virt-manager.enable = false;
    virtualisation.libvirtd.enable = false;
    virtualisation.spiceUSBRedirection.enable = false;
}