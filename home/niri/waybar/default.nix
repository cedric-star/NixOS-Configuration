{ pkgs, inputs, ... }:

{
  programs.waybar = {
  
    enable = true;

    style = ''
* {
    border: none;
    border-radius: 0;
    font-family: Roboto, Helvetica, Arial, sans-serif;
    font-size: 13px;
    box-shadow: none;
    background: transparent;
}

window#waybar {
    background: rgba(43, 48, 59, 0.0);
    border-bottom: 3px solid rgba(100, 114, 125, 0.5);
    color: white;
}

tooltip {
  background: rgba(43, 48, 59, 0.5);
  border: 1px solid rgba(100, 114, 125, 0.5);
}
tooltip label {
  color: white;
}

#workspaces button {
    padding: 0 5px;
    background: transparent;
    color: white;
    border-bottom: 3px solid transparent;
}

#workspaces button.focused {
    background: #64727D;
    border-bottom: 3px solid white;
}

#mode,
#clock,
#battery,
#cpu,
#memory,
#network,
#pulseaudio,
#temperature {
    background-color: #27121e;
    padding: 4p;
    color: #e8d2b8;
}
      
      
    '';

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

  };
}
