{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "de" "en-US" ];
    profiles = {
      default = {
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
  #stylix.targets.firefox.profileNames = [ "default" ];
}
