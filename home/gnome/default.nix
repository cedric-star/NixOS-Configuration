{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.burn-my-windows
    gnomeExtensions.transparent-window-moving

    dconf-editor
    tela-icon-theme
    qogir-theme
    gnome-tweaks
  ];



### Hintergrundbild importieren
  home.file.".local/share/wallpapers/b1.png".source = ./wallpapers/b1.png;

  dconf.settings = {
    "org/gnome/shell" = {

### Alle Erweiterungen
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "burn-my-windows@schneegans.github.com"
        "transparent-window-moving@noobsai.github.com"

      ];


      favorite-apps = [
        "kitty.desktop"
        "firefox.desktop"
        "org.gnome.Geary.desktop"
        "org.gnome.Calendar.desktop"
        "org.gnome.Nautilus.desktop"
      ];
    };

### Blur My Shell alles blurryyyy
    "org/gnome/shell/extensions/blur-my-shell" = {
      blur = true;
    };


### Transparenz von Fenstern beim verschieben
    "org/gnome/shell/extensions/transparent-window-moving" = {
      enable = true;
      opacity = 70; # Noch transparenter während Bewegung
    };



### Schließenanimation für alle Fenster
    "org/gnome/shell/extensions/burn-my-windows" = {
      active-profile = "aura";
      aura = {
        animation-time = 394;
        color-randomize = true;
        color-randomize-hue = 0.00;
        effect-speed = 1.07;
        color-saturation = 0.21;
        block-size = 1.00;
        block-hardness = 1.00;
        blur-size = 23.07;
      };
    };


### fenster klein, groß, schließen buttons dazutun
    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };


### Themen
    "org/gnome/desktop/interface" = {
      gtk-theme = "Qogir-win-dark";
      icon-theme = "Tela-nord-light";
      cursor-theme = "Adwaita";
    };
    "org/gnome/shell/extensions/user-theme" = {
      name = "Qogir-win-dark"; 
    };


### Hintergrund klar für dark und light mode
    "org/gnome/desktop/background" = {
      picture-uri = "file://${config.home.homeDirectory}/.local/share/wallpapers/b1.png";
      picture-options = "zoom";
      picture-uri-dark = "file://${config.home.homeDirectory}/.local/share/wallpapers/b1.png";
    };
    "org/gnome/desktop/screensaver" = {
      picture-uri = "file://${config.home.homeDirectory}/.local/share/wallpapers/b1.png";
      picture-uri-dark = "file://${config.home.homeDirectory}/.local/share/wallpapers/b1.png";
    };    
  };
}
