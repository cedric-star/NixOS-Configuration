{ pkgs, lib, config, inputs, ... }:

{


  stylix.enable = true;
  stylix.image = ./wallpapers/b1.png;
  stylix.base16Scheme = {
    base00 = "1a0f14"; # Default Background
    base00-transparent = "1a0f1480"; # 50% transparent

    
    base01 = "25181e"; # Lighter Background
    base02 = "302128"; # Selection Background
    base03 = "4a3a40"; # Comments
    base04 = "655359"; # Dark Foreground
    base05 = "d8c8cf"; # Default Foreground
    base06 = "e3d8dd"; # Light Foreground
    base07 = "efe8eb"; # Light Background
    base08 = "e8b4c9"; # Red/Pink
    base09 = "e8d4b4"; # Orange/Beige
    base0A = "f0d8a8"; # Yellow/Warm Beige
    base0B = "c9e8b4"; # Green
    base0C = "b4e8d4"; # Cyan
    base0D = "d4b4e8"; # Blue
    base0E = "e8b4d4"; # Magenta
    base0F = "d8a870"; # Brown
  };
  stylix.polarity = "dark";
  
  config.stylix.targets.firefox.profileNames = [ "default" ];
}
