{ config, pkgs, ... }:

{
  # Open network ports
  networking.firewall.allowedTCPPorts = [
    7000
    7001
    7100
  ];
  networking.firewall.allowedUDPPorts = [
    5353
    6000
    6001
    7011
  ];

  # To enable network-discovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;

    settings.publish = {
      disable-publishing = false;
      publish-addresses = true;
      publish-workstation = true; # Key fix: add the publish- prefix
      disable-user-service-publishing = false;
      publish-domain = true; # Similarly, should have the publish- prefix
    };
  };

  environment.systemPackages = with pkgs; [
    uxplay
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
  ];
}
