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
    userName = "cedric-star";
    userEmail = "cdrc.wnsch@gmail.com";
  };

  programs.fish.enable = true;


  #programs.java.enable = true;
  home.file.".jdks/jdk21".source = "${pkgs.openjdk21}/lib/openjdk";
  home.sessionVariables.JAVA_HOME = "$HOME/.jdks/jdk21";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };


  home.sessionVariables = {
    TERMINAL = "kitty";

  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
