{ lib, config, pkgs, ... }:
{
  services.flatpak = {
    enable = true;
    packages = [ 
      "io.mgba.mGBA"                # gameboy advance
      "io.github.aandrew_me.ytdn"   # youtube downloader
      "net.werwolv.ImHex"           # hex editor (besser als wilhelm lol)
      "org.vinegarhq.Sober"         # roblox
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