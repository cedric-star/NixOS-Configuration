{ config, pkgs, ... }:

{

  #home.file.".config/ricing/openbar.conf".source = ./configs/openbar.conf;

  dconf.settings = {
    "org/gnome/shell/extensions/openbar" = {

      extraConfig = ./configs/openbar.conf;
      
    };
  };
}