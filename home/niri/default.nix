{config, lib, pkgs, inputs, ...}:

let 
  system = "x86_64-linux";

in {
  imports = [
    ./quickshell
  ];

  home.packages = with pkgs; [
    # X11-Kompatibilität (automatisch seit Niri 25.08)
    xwayland-satellite  # Nur installieren, Niri erkennt es automatisch!

    # Essentials
    swaybg              # Wallpaper
    libnotify           # Notifications
    pamixer             # Audio control
    wl-clipboard-rs     # Clipboard (Wayland-native)
    
    # UI/Apps
    waybar              # Status bar (optional wenn du Quickshell nutzt)
    swww                # Wallpaper daemon (alternativ zu swaybg)
    wofi                # App launcher (oder fuzzel als Alternative)
    fuzzel              # Alternative launcher, besser integriert
    
    # Portale für Screen Sharing, File Picker etc.
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome  # Für screencasting
    
    # Weitere Essentials
    mako                # Notification daemon (falls nicht in Quickshell)
    swaylock            # Screen locker
    swayidle            # Idle management
    udiskie             # USB auto-mount
  ];

  home.file.".config/niri/config.kdl".source = ./config.kdl;
  home.file.".config/niri/b1.png".source = ../../stylix/wallpapers/b1.png;
 # WICHTIG: Environment-Variablen für Wayland-Apps
  # (Niri setzt DISPLAY automatisch für X11-Apps seit 25.08!)
  home.sessionVariables = {
    # Wayland-native Apps forcieren
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    
    # Firefox/Thunderbird Wayland
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_DBUS_REMOTE = "1";
    
    # Electron/Chromium Wayland
    NIXOS_OZONE_WL = "1";
    
    # Java Wayland
    JAVA_TOOL_OPTIONS = "-Dsun.java2d.uiScale=2";
  };

  # xdg-desktop-portal für Screen Sharing, File Dialoge etc.
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    configPackages = [ pkgs.niri ];
  };


}