{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./gnome  
    ./niri
    ./home_programs
    ./services.nix
    ./xdg_configs
    ./aliases.nix
  ];  

  programs.home-manager.enable = true;
  gtk.gtk4.theme = config.gtk.theme;

  home.username = "cedric";
  home.homeDirectory = "/home/cedric";

  programs.fish.enable = true;

  home.file.".jdks/jdk21".source = "${pkgs.openjdk21}/lib/openjdk";
  home.sessionVariables.JAVA_HOME = "$HOME/.jdks/jdk21";

  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.enableNixpkgsReleaseCheck = false;

  home.file = { };

  programs.hellvim.enable = true;


  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
    };
  };

}
