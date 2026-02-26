{ pkgs, inputs, ... }:

{
  programs.waybar = {
  
    enable = true;

    style = builtins.readFile ./style3.css;

    settings = [{
      height = 30;
      layer = "top";
      position = "top";
      tray = { spacing = 10; };

      modules-center = [ "clock" ];
      modules-left = [ "custom/logo" "niri/workspaces" ];

      "custom/logo" = {
        format = "    ";
        tooltip = false;
        on-click = "exec kitty";
     };

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
        format-disconnected = "Disconnected";
        format-ethernet = "{ifname}: {ipaddr}/{cidr}";
        format-linked = "{ifname} (No IP) ";
        format-wifi = "{essid} ({signalStrength}%)";
        on-click = "kitty \"nmtui\"";
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
