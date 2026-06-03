{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [

  ];

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    extraPackages = with pkgs.yaziPlugins; [
      git
      drag      # drag n drop
      glow
      gvfs      # mount devices
      ouch      # preview archives
      yafg      # find and search stuff
      chmod     # change files mode
      office    # preview office documents
      convert   # convert images
      compress  # compress files
      clipboard # copy file paths
      mediainfo # preview media 
      wl-clipboard
    ];

    keymap = {
    # Manager keybindings (main file manager interface)
      mgr.prepend_keymap = [
        # Navigation with k, l, j, ö
        { on = [ "k" ]; run = "arrow 1"; desc = "Move down"; }
        { on = [ "l" ]; run = "arrow -1"; desc = "Move up"; }
        { on = [ "j" ]; run = "leave"; desc = "Move left (parent dir)"; }
        { on = [ "ö" ]; run = "enter"; desc = "Move right (enter dir)"; }
        
        # Copy operation
        { on = [ "c" ]; run = "copy"; desc = "Copy selected files"; }
        
        # Quit/close Yazi
        { on = [ "q" ]; run = "quit"; desc = "Quit Yazi"; }
        { on = [ "<Esc>" ]; run = "close"; desc = "Close Yazi"; }
        
        # Open file with default application
        { on = [ "Enter" ]; run = "open"; desc = "Open file with default app"; }
        
        # Search files or content
        { on = [ "<C-f>" ]; run = "search fd"; desc = "Search files/folders"; }
      ];
        
        # Optional: Add same navigation to visual mode (for selection)
      visual.prepend_keymap = [
        { on = [ "k" ]; run = "arrow 1"; desc = "Move down"; }
        { on = [ "l" ]; run = "arrow -1"; desc = "Move up"; }
        { on = [ "j" ]; run = "leave"; desc = "Move left"; }
        { on = [ "ö" ]; run = "enter"; desc = "Move right"; }
        { on = [ "c" ]; run = "copy"; desc = "Copy selected"; }
        { on = [ "<Esc>" ]; run = "escape"; desc = "Exit visual mode"; }
      ];
        
      # Optional: Add search to input mode
      input.prepend_keymap = [
        { on = [ "<Esc>" ]; run = "escape"; desc = "Cancel input"; }
      ];
    };
        
  };
}
