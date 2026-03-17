{ pkgs, inputs, ... }:

{
  #home.file.".config/fuzzel/fuzzel.ini".source = ./fuzzel.ini;

  programs.wlogout= {
  
    enable = true;
  };
}
