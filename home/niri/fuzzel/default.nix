{ pkgs, inputs, ... }:

{
  home.file.".config/fuzzel/fuzzel.ini" = {
    source = ./dotfiles/fuzzel/fuzzel.ini; # Or wherever your file is
    force = true; # This will override the module's file
  };

}
