{ config, pkgs, ...}:
### categories:

#AudioVideo	Application for presenting, creating, or processing multimedia (audio/video)	 
#Audio	An audio application	Desktop entry must include AudioVideo as well
#Video	A video application	Desktop entry must include AudioVideo as well
#Development	An application for development	 
#Education	Educational software	 
#HealthFitness	Applications related to physical or mental health and fitness	 
#Game	A game	 
#Graphics	Application for viewing, creating, or processing graphics	 
#Network	Network application such as a web browser	 
#Office	An office type application	 
#Science	Scientific software	 
#Settings	Settings applications	Entries may appear in a separate menu or as part of a "Control Center"
#System	System application, "System Tools" such as say a log viewer or network monitor	 
#Utility	Small utility application, "Accessories"


{
  home.packages = with pkgs; [
    # Portale für Screen Sharing, File Picker etc.
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome  # Für screencasting
  ];

  
  xdg.desktopEntries = {
    uxplay = {
      categories = [
        "AudioVideo"
        "Network"
        "Graphics"
      ];
      exec = "uxplay -p 7000,7001,7100";
      genericName = "iOS Screenshare";
      name = "UXPlay";
      terminal = false;
      icon = ./icons/airplay.svg;
    };
  };

  # xdg-desktop-portal für Screen Sharing, File Dialoge etc.
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    config.common.default = "gnome";
    configPackages = [ pkgs.niri ];
  };

  xdg.mimeApps = {
    enable = true;
    
    # Standardanwendungen für verschiedene MIME-Typen
    defaultApplications = {
      # Bilddateien - GNOME Photos
      "image/jpeg" = "org.gnome.Loupe.desktop";        # oder "org.gnome.Photos.desktop"
      "image/jpg" = "org.gnome.Loupe.desktop";
      "image/png" = "org.gnome.Loupe.desktop";
      "image/gif" = "org.gnome.Loupe.desktop";
      "image/webp" = "org.gnome.Loupe.desktop";
      "image/svg+xml" = "org.gnome.Loupe.desktop";
      "image/bmp" = "org.gnome.Loupe.desktop";
      "image/tiff" = "org.gnome.Loupe.desktop";
      
      # Videodateien - VLC
      "video/mp4" = "vlc.desktop";
      "video/mpeg" = "vlc.desktop";
      "video/x-msvideo" = "vlc.desktop";      # AVI
      "video/x-matroska" = "vlc.desktop";     # MKV
      "video/webm" = "vlc.desktop";
      "video/quicktime" = "vlc.desktop";      # MOV
      "video/x-ogm" = "vlc.desktop";          # OGM
      
      # PDF - Firefox
      "application/pdf" = "firefox.desktop";
      
      # Quelltextdateien - VSCodium
      "text/plain" = "codium.desktop";              # Allgemeine Textdateien
      "text/x-python" = "codium.desktop";           # Python
      "text/x-haskell" = "codium.desktop";          # Haskell
      "text/x-yaml" = "codium.desktop";             # YAML
      "text/x-sh" = "codium.desktop";               # Shell-Skripte
      "text/csv" = "codium.desktop";                # CSV
      "application/json" = "codium.desktop";        # JSON
      "application/geo+json" = "codium.desktop";    # GeoJSON
      "text/x-script.python" = "codium.desktop";
      "text/x-script.sh" = "codium.desktop";
      
      # Office-Dateien - LibreOffice
      "application/msword" = "libreoffice-writer.desktop";                 # .doc
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = "libreoffice-writer.desktop";  # .docx
      "application/vnd.ms-excel" = "libreoffice-calc.desktop";             # .xls
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = "libreoffice-calc.desktop";        # .xlsx
      "application/vnd.ms-powerpoint" = "libreoffice-impress.desktop";     # .ppt
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = "libreoffice-impress.desktop";  # .pptx
      "application/vnd.oasis.opendocument.text" = "libreoffice-writer.desktop";      # .odt
      "application/vnd.oasis.opendocument.spreadsheet" = "libreoffice-calc.desktop"; # .ods
      "application/vnd.oasis.opendocument.presentation" = "libreoffice-impress.desktop";  # .odp
      
      # BLEND-Dateien - Blender
      "application/x-blender" = "blender.desktop";
      
      # ===== Weitere sinnvolle Ergänzungen =====
      
      # Audio-Dateien
      "audio/mpeg" = "vlc.desktop";                 # MP3
      "audio/flac" = "vlc.desktop";
      "audio/x-wav" = "vlc.desktop";
      "audio/ogg" = "vlc.desktop";
      "audio/aac" = "vlc.desktop";
      
      # Markdown und Dokumentation
      "text/markdown" = "codium.desktop";
      "text/md" = "codium.desktop";
      "text/x-markdown" = "codium.desktop";
      
      # HTML/Web
      "text/html" = "firefox.desktop";
      "application/xhtml+xml" = "firefox.desktop";
      
      # URL-Handler
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
    };
  };
}