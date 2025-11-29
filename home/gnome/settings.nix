{ config, pkgs, lib, ... }:


{
  home.packages = with pkgs; [
    dconf-editor
    tela-icon-theme
    gnome-tweaks
    gdm-settings
    #lxappearance
  ];

  ### Templates importieren
  home.file.".local/share/Templates" = {
    source = ./templates;
    recursive = true;
  };
  home.activation.myCopyTemplates = lib.hm.dag.entryAfter ["writeBoundary"] ''
    cp -r $HOME/.local/share/Templates $HOME/Templates
  '';


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

    "org/gnome/desktop/interface" = {
      show-battery-percentage = true;
    };
  };

  
}