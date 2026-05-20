{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings.user = {
      email = "cdrc.wnsch@gmail.com";
      name = "cedric-star";
    };
  };
}
