{ config, pkgs, ...}:
 
{

  # home.file.".config/kitty/b1.png".source = ../gnome/wallpapers/b1.png;
  programs.kitty = {
    enable = false;
 
    
    settings = {
      #background_opacity = 0.92;
      hide_window_decorations = "no";
    };
    
    
    shellIntegration.enableFishIntegration = true;
    extraConfig = ''
      # shell ${pkgs.fish}/bin/fish

      copy_on_select yes
      
      map ctrl+shift+c copy_to_clipboard
      map ctrl+shift+v paste_from_clipboard
    '';
  };
}