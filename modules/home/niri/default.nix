{config, lib, pkgs, inputs, ...}:

{
  imports = [
    ./noctalia
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
    awww                # Wallpaper daemon (alternativ zu swaybg)
    fuzzel              # Alternative launcher, besser integriert
    pavucontrol         # Audio
    
    # Weitere Essentials
    swaylock            # Screen locker
    swayidle            # Idle management
    udiskie             # USB auto-mount

    wl-mirror
    cliphist
  ];

  services.cliphist.enable = true;

  home.file.".config/niri/config.kdl".source = ./config.kdl;
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
  };
}