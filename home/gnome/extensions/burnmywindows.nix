{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gnomeExtensions.burn-my-windows
  ];

  dconf.settings = {
    "org/gnome/shell" = {enabled-extensions = [ "burn-my-windows@schneegans.github.com "];};
  ### Schließenanimation für alle Fenster
    "org/gnome/shell/extensions/burn-my-windows" = {
      active-profile = "aura-glow";
      effect = "aura-glow";

      extraConfig = ''
        [burn-my-windows-profile]
        activation-mode=' normal'
        duration=1.5
        effect='aura' 
        enable=true 
        apparition-enable-effect=false
        fire-enable-effect=false 
        aura-glow-enable-effect=true
        aura-glow-random-color=true

        #kommi1
        aura-glow-animation-time=1207
        aura-glow-speed=1.3700000000000001
        aura-glow-saturation=0.23000000000000001

        #kommi2
        aura-glow-edge-hardness=1.0
        aura-glow-blur=18.800000000000001
        aura-glow-start-hue=0.0
        energize-b-enable-effect=false
        tv-glitch-enable-effect=true
        aura-glow-edge-size=0.56000000000000005

      '';
    };
  };  
}