{ config, pkgs, ... }:


{
  home.packages = with pkgs; [
    dconf-editor
    tela-icon-theme
    qogir-theme
    gnome-tweaks
    gdm-settings
    #lxappearance
  ];

  ### Hintergrundbild importieren
  home.file."Templates".source = ./templates;

  dconf.settings = {
    "org/gnome/shell" = {

      favorite-apps = [
        "kitty.desktop"
        "firefox.desktop"
        "org.gnome.Geary.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };

    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };

    ### fenster klein, groß, schließen buttons dazutun
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

    ### Themen
    #"org/gnome/desktop/interface" = {
    #  gtk-theme = "Qogir-win-dark";
    #  icon-theme = "Tela-nord-light";
    #  cursor-theme = "Adwaita";
    #};


    ### Hintergrund klar für dark und light mode
    #"org/gnome/desktop/background" = {
    #  picture-uri = "file://${config.home.homeDirectory}/.local/share/wallpapers/b1.png";
    #  picture-options = "zoom";
    #  picture-uri-dark = "file://${config.home.homeDirectory}/.local/share/wallpapers/b1.png";
    #};
    #"org/gnome/desktop/screensaver" = {
    #  picture-uri = "file://${config.home.homeDirectory}/.local/share/wallpapers/b1.png";
    #  picture-uri-dark = "file://${config.home.homeDirectory}/.local/share/wallpapers/b1.png";
    #}; 

  };

  
}