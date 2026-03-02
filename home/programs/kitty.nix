{ config, pkgs, ...}:
 
{

  # home.file.".config/kitty/b1.png".source = ../gnome/wallpapers/b1.png;
  programs.kitty = {
    enable = true;
 
    
    settings = {
      
      hide_window_decorations = "yes";
    };
    
    
    shellIntegration.enableFishIntegration = true;
    extraConfig = ''
      # shell ${pkgs.fish}/bin/fish
      background_opacity 0.9

      copy_on_select yes
      tab_title_template [katze: {index}]
      
      map ctrl+shift+c copy_to_clipboard
      map ctrl+shift+v paste_from_clipboard


      map ctrl+shift+j previous_tab
      map ctrl0xf66 next_tab
    '';
  };
}
