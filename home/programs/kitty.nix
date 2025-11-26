{ config, pkgs, ...}:
 
{

  # home.file.".config/kitty/b1.png".source = ../gnome/wallpapers/b1.png;
  programs.kitty = {
    enable = true;
 
    
    settings = {
      #background_opacity = 0.92;
      hide_window_decorations = "no";
    };
    
    
    shellIntegration.enableFishIntegration = true;

  };
}