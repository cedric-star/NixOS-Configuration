{ config, pkgs, ...}:

{
  imports = [
    ./programs.nix
    ./python.nix
    ./steam.nix
  ];


  xdg.mime = {
    # mimetype herausfinden mit: 'xdg-mime query filetype <dateiname>'
    # passende Anwendung finden: 'cd /run/current-system/sw/share/applications/'
    enable = true;
    defaultApplications = {
      "application/pdf" = [ "firefox.desktop" ];
      "text/plain" = [ "org.gnome.TextEditor.desktop" ];
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/jpg" = [ "org.gnome.Loupe.desktop" ];
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
    };
  };
}