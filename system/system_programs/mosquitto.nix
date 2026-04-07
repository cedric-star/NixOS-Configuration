{ config, pkgs, ... }:

{
  services.mosquitto = {
    enable = true;
    listeners = [
      {
        # Erlaubt allen Zugriff auf alle Topics (für Testzwecke)
        acl = [ "pattern readwrite #" ];
        omitPasswordAuth = true;
        settings.allow_anonymous = true;
      }
    ];
  };

  # Firewall Regel für MQTT Port 1883
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 1883 ];
  };
  
}
