{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./programs
    ./gnome  
  ];  

  # Home Manager needs a bit of information about you and the paths it should

  # manage.
  home.username = "cedric";
  home.homeDirectory = "/home/cedric";

  programs.git = {
    enable = true;
  #  #settings = {
  #    userName = "cedric-star";
  #    userEmail = "cdrc.wnsch@gmail.com";
  #  };
  };

  programs.fish.enable = true;
 


  #programs.java.enable = true;
  home.file.".jdks/jdk21".source = "${pkgs.openjdk21}/lib/openjdk";
  home.sessionVariables.JAVA_HOME = "$HOME/.jdks/jdk21";

  home.stateVersion = "25.11"; # Please read the comment before changing.
  home.enableNixpkgsReleaseCheck = false;

  home.file = { };

  programs.home-manager.enable = true;
}
