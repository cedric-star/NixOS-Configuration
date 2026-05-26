{ config, pkgs, ... }:

{
  home.shellAliases = {
    vim = "nvim";
    vi = "nvim";
    cat = "bat";

    "hp-buch-rebuild" = "git add . && sudo nixos-rebuild switch --flake .#hp-buch";

  };
}

