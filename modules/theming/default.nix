{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    adw-gtk3
    nwg-look
    glib
    pywal
    pywalfox-native
  ];

  environment.sessionVariables = {
    GTK_THEME = "adw-gtk3";
  };
}
