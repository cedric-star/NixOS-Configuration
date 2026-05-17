{ config, pkgs, ... }:

{
  home.file.".config/burn-my-windows/profiles/1762983870745102.conf" = {
    text = ''
[burn-my-windows-profile]
aura-glow-enable-effect=true
aura-glow-animation-time=443
fire-enable-effect=false
aura-glow-speed=0.0
aura-glow-edge-size=0.68000000000000005
aura-glow-saturation=0.14000000000000001
aura-glow-random-color=false
aura-glow-blur=0.0
aura-glow-start-hue=0.83000000000000000
  '';
  force = true;  # Überschreibt vorhandene Datei
  };

  dconf.settings = {
    
  ### Schließenanimation für alle Fenster
    "org/gnome/shell/extensions/burn-my-windows" = {
      effect = "aura-glow";
    };
  };  
}
