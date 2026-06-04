{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    adw-gtk3
    nwg-look
    glib
    pywal
    pywalfox-native
    gsettings-desktop-schemas
    wallust
    spicetify-cli

  ];

  environment.pathsToLink = [
    "/share/gsettings-schemas"
  ];

  environment.sessionVariables = {
    GTK_THEME = "adw-gtk3";
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
    MOZ_ENABLE_WAYLAND="1";
  };

  programs.dconf.enable = true;
}