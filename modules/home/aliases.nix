{ config, pkgs, ... }:

{
  home.shellAliases = {
    vim = "nvim";
    vi = "nvim";
    cat = "bat";
    signal = "signal-desktop --password-store='gnome-libsecret'";

    hp-buch-rebuild = "git add . && sudo nixos-rebuild switch --flake .#hp-buch";

  };
}

