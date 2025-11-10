{ config, pkgs, ...}:
 
{

  home.file.".config/kitty/b1.png".source = ../gnome/wallpapers/b1.png;
  programs.kitty = {
    enable = true;
    
    
    settings = {
      background_opacity = 0.92;
      hide_window_decorations = "no";

      
    };
    
    
    shellIntegration.enableFishIntegration = true;
    extraConfig = ''
      shell ${pkgs.fish}/bin/fish
      
      background            #161718
      foreground            #c4c8c5
      cursor                #d0d0d0
      selection_background  #444444
      color0                #000000
      color8                #ac1ea0
      color1                #fc5ef0
      color9                #fc5ef0
      color2                #86c38a
      color10               #94f936
      color3                #ffd6b1
      color11               #f5ffa7
      color4                #85befd
      color12               #95cbfe
      color5                #b9b5fc
      color13               #b9b5fc
      color6                #85befd
      color14               #85befd
      color7                #dfdfdf
      color15               #dfdfdf
      selection_foreground #161718

      active_tab_foreground   #eeeeee
      active_tab_background   #444444
      inactive_tab_foreground #c4c8c5
      inactive_tab_background #121213

      # Tastenkombinationen für Kopieren & Einfügen
      map ctrl+shift+c copy_to_clipboard
      map ctrl+shift+v paste_from_clipboard
    '';
  };
}