{ pkgs, inputs, ... }:

{
  programs.waybar = {
  
    enable = true;

    settings = [{
      height = 30;
      layer = "top";
      position = "top";
      tray = { spacing = 10; };

      modules-center = [ "clock" ];
      modules-left = [ "niri/workspaces" ];

      "niri/workspaces" = {
        all-output = true;
        format = "{index}";
      };

      modules-right = [
        "pulseaudio"
        "network"
        "cpu"
        "memory"
        "temperature"
        "battery"
      ];

      battery = {
        format = "Akku: {capacity}%";
        format-alt = "{time} {icon}";
        format-charging = "{capacity}% ";
        format-icons = [ "" "" "" "" "" ];
        format-plugged = "{capacity}% ";
        states = {
          critical = 15;
          warning = 30;
        };
      };
      clock = {
        format-alt = "{:%Y-%m-%d}";
        tooltip-format = "{:%Y-%m-%d | %H:%M}";
      };
      cpu = {
        format = "CPU: {usage}%";
        tooltip = false;
      };
      memory = { format = "RAM: {}%"; };
      network = {
        interval = 1;
        format-alt = "{ifname}: {ipaddr}/{cidr}";
        format-disconnected = "Disconnected ⚠";
        format-ethernet = "{ifname}: {ipaddr}/{cidr}   up: {bandwidthUpBits} down: {bandwidthDownBits}";
        format-linked = "{ifname} (No IP) ";
        format-wifi = "{essid} ({signalStrength}%) ";
      };
      pulseaudio = {
        format = "Audio: {volume}%";
        format-bluetooth = "ᚼᛒ : {volume}%";
        format-muted = "Audio Muted";
        on-click = "pavucontrol";
      };

      temperature = {
        critical-threshold = 80;
        format = "Temperatur: {temperatureC}°C";
      };
    }];

    style = ''
/* ============================================
   GLOBAL & RESET
   ============================================ */

/* Alle Elemente - Grundreset */
* {
    font-family: "JetBrains Mono", "Font Awesome 6 Free";
    font-size: 13px;
    min-height: 0;
    border: none;
    border-radius: 0;
    padding: 0;
    margin: 0;
    color: #ffffff;  /* EINHEITLICHE FARBE für alle Texte */
}

/* ============================================
   BAR (Hauptleiste)
   ============================================ */

#waybar {
    background: transparent;           /* Transparenz */
    /* oder */
    background: rgba(0, 0, 0, 0.0);    /* Vollständig transparent */
    /* oder */
    background: rgba(30, 30, 46, 0.7); /* Halbtransparent mit Farbe */
    
    color: #ffffff;
    transition-property: background-color;
    transition-duration: 0.5s;
}

/* ============================================
   WORKSPACES (niri/workspaces)
   ============================================ */

#workspaces {
    background: transparent;
    margin: 0 5px;
}

/* Einzelner Workspace-Button */
#workspaces button {
    padding: 0 10px;
    margin: 0 2px;
    color: #ffffff;                    /* EINHEITLICHE FARBE */
    background: transparent;
    border: none;
    border-radius: 4px;
    transition: all 0.3s ease;
}

/* Workspace-Hover */
#workspaces button:hover {
    background: rgba(255, 255, 255, 0.1);
    color: #ffffff;
    box-shadow: inset 0 -2px #ffffff;
}

/* Aktiver Workspace */
#workspaces button.active {
    background: rgba(255, 255, 255, 0.2);
    color: #ffffff;
    border-bottom: 2px solid #ffffff;
}

/* Fokussierter Workspace */
#workspaces button.focused {
    background: rgba(255, 255, 255, 0.25);
    color: #ffffff;
}

/* Leerer Workspace */
#workspaces button.empty {
    color: rgba(255, 255, 255, 0.5);   /* Gedimmte einheitliche Farbe */
}

/* Dringender Workspace */
#workspaces button.urgent {
    background: rgba(255, 0, 0, 0.3);
    color: #ffffff;
    animation: blink 1s infinite;
}

/* Spezifische Workspaces über ID */
#workspaces button:nth-child(1) { }
#workspaces button:nth-child(2) { }
/* etc. */

/* ============================================
   MODULES - ALLGEMEIN
   ============================================ */

/* Jedes Modul */
#clock,
#battery,
#cpu,
#memory,
#disk,
#temperature,
#backlight,
#network,
#pulseaudio,
#wireplumber,
#custom-media,
#tray,
#mode,
#idle_inhibitor,
#scratchpad,
#mpd {
    padding: 0 10px;
    margin: 0 4px;
    color: #ffffff;                    /* EINHEITLICHE FARBE */
    background: transparent;
}

/* ============================================
   CLOCK
   ============================================ */

#clock {
    /* Format-spezifisch über Klassen */
}

#clock.date { }
#clock.time { }

/* ============================================
   BATTERY
   ============================================ */

#battery {
    color: #ffffff;
}

#battery.charging {
    color: #00ff00;                    /* Oder einheitlich: #ffffff */
}

#battery.plugged {
    color: #ffffff;
}

#battery.critical:not(.charging) {
    color: #ff0000;                    /* Oder einheitlich mit Animation */
    animation: blink 2s infinite;
}

#battery.warning:not(.charging) {
    color: #ffaa00;
}

/* ============================================
   CPU & MEMORY
   ============================================ */

#cpu {
    color: #ffffff;
}

#cpu.high {                         /* Bei hoher Last */
    color: #ff5555;
}

#memory {
    color: #ffffff;
}

#memory.high {
    color: #ff5555;
}

/* ============================================
   TEMPERATURE
   ============================================ */

#temperature {
    color: #ffffff;
}

#temperature.critical {
    color: #ff0000;
    animation: blink 1s infinite;
}

/* ============================================
   NETWORK
   ============================================ */

#network {
    color: #ffffff;
}

#network.disconnected {
    color: #ff5555;
    /* oder einheitlich: color: #ffffff; */
}

#network.wifi {
    /* WLAN-spezifisch */
}

#network.ethernet {
    /* LAN-spezifisch */
}

/* ============================================
   PULSEAUDIO
   ============================================ */

#pulseaudio {
    color: #ffffff;
}

#pulseaudio.muted {
    color: #888888;                    /* Oder einheitlich gedimmt */
    /* oder: color: #ffffff; opacity: 0.5; */
}

#pulseaudio.bluetooth {
    /* Bluetooth-spezifisch */
}

#pulseaudio.source-muted {
    /* Mikrofon stumm */
}

/* ============================================
   TRAY
   ============================================ */

#tray {
    background: transparent;
    margin: 0 10px;
}

#tray > .passive {
    -gtk-icon-effect: dim;
    opacity: 0.7;
}

#tray > .needs-attention {
    -gtk-icon-effect: highlight;
    animation: blink 1s infinite;
}

/* Tray-Menüs */
#tray menu {
    background: rgba(30, 30, 46, 0.95);
    color: #ffffff;
    border-radius: 8px;
    padding: 10px;
}

#tray menuitem {
    padding: 5px 15px;
    color: #ffffff;
}

#tray menuitem:hover {
    background: rgba(255, 255, 255, 0.1);
}

/* ============================================
   CUSTOM MODULES
   ============================================ */

#custom-media {
    color: #ffffff;
    min-width: 100px;
}

#custom-media.custom-spotify { }
#custom-media.custom-vlc { }

/* ============================================
   SWAY/NIRI MODE
   ============================================ */

#mode {
    background: rgba(255, 255, 255, 0.2);
    color: #ffffff;
    padding: 0 15px;
    border-radius: 4px;
    font-weight: bold;
}

/* ============================================
   IDLE INHIBITOR
   ============================================ */

#idle_inhibitor {
    color: #ffffff;
}

#idle_inhibitor.activated {
    color: #ffffff;
    background: rgba(255, 255, 255, 0.1);
}

/* ============================================
   TOOLTIPS
   ============================================ */

tooltip {
    background: rgba(30, 30, 46, 0.95);
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 8px;
    color: #ffffff;
    padding: 10px;
}

tooltip label {
    color: #ffffff;
}

/* ============================================
   ANIMATIONEN
   ============================================ */

@keyframes blink {
    0% { opacity: 1; }
    50% { opacity: 0.3; }
    100% { opacity: 1; }
}

@keyframes gradient {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}

/* ============================================
   ZUSTÄNDE (States)
   ============================================ */

/* Hover-Zustände für alle Module */
#clock:hover,
#battery:hover,
#cpu:hover,
#memory:hover,
#network:hover,
#pulseaudio:hover {
    background: rgba(255, 255, 255, 0.1);
    border-radius: 4px;
    transition: all 0.3s ease;
}

/* Aktiv/Drücken-Zustand */
#workspaces button:active,
#clock:active,
#pulseaudio:active {
    background: rgba(255, 255, 255, 0.2);
}

/* ============================================
   PSEUDO-ELEMENTE (begrenzt in GTK)
   ============================================ */

/* Vor/Nach Inhalt - funktioniert teilweise */
#clock::before {
    content: "⏱ ";
    color: #ffffff;
}

/* ============================================
   RESPONSIVE/CONDITIONAL
   ============================================ */

/* Nur wenn Bar im Hidden-Modus */
#waybar.hidden {
    opacity: 0;
}

/* Vollbild-Modus */
#waybar.fullscreen {
    background: transparent;
}

/* ============================================
   GRUPPIERUNG
   ============================================ */

/* Mehrere Module zusammenfassen */
.modules-left,
.modules-center,
.modules-right {
    background: transparent;
    padding: 0 10px;
}

/* Spezifische Gruppen */
.modules-left > widget:first-child > #workspaces {
    margin-left: 0;
}

.modules-right > widget:last-child > #clock {
    margin-right: 0;
}
    '';
  };
}
