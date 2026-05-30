{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    #configPath = "${config.xdg.configHome}/mozilla/firefox";
    languagePacks = [ "de" "en-US" ];
    profiles = {
      default = {
        #extensions.force = true;
        #extensions = with pkgs.nur.repos.rycee.firefox-addons; [ pywalfox ];
        settings = {
          "browser.search.regions" = "DE";
          "identity.fxaccounts.account.device.name" = "nixos";
          "services.sync.username" = "bin130022@gmail.com";


       	  "services.sync.enging.bookmarks" = true;
          "services.sync.enging.history" = true;
          "services.sync.enging.tabs" = false;
          "services.sync.enging.passwords" = true;
          "services.sync.enging.addons" = true;
          "services.sync.enging.prefs" = true;
        };  
      };
    };    
  };
}
