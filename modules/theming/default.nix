{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    adw-gtk3
    nwg-look
    glib
  ];

  environment.sessionVariables = {
    GTK_THEME = "adw-gtk3";
  };
}
