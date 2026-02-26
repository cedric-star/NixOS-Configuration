{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userEmail = "cdrc.wnsch@gmail.com";
    userName = "cedric-star";
  };
}
