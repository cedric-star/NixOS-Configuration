{ pkgs, inputs, ... }:

{
  home.file.".config/fuzzel/fuzzel.ini".source = ./fuzzel.ini;

  programs.fuzzel= {
  
    enable = true;
  };
}
