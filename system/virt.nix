{ config, pkgs, ...}:

{
    virtualisation.docker.enable = true;

    virtualisation.virtualbox.host = {
        enable = true;
        package = pkgs.virtualbox;

    };


    programs.virt-manager.enable = true;
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;
    #boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];
}