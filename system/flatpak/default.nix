{ lib, config, pkgs, ... }:
{
  services.flatpak = {
    enable = true;
    packages = [ 
      "io.mgba.mGBA" 
      "io.github.aandrew_me.ytdn"
      "us.zoom.Zoom"
    ];


  };
  systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };


}