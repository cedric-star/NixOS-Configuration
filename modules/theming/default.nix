{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    adw-gtk3
    nwg-look
    glib
    pywal
    pywalfox-native
    gsettings-desktop-schemas
  ];

  environment.pathsToLink = [
    "/share/gsettings-schemas"
  ];

  environment.sessionVariables = {
    GTK_THEME = "adw-gtk3";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
  };

  programs.dconf.enable = true;
}