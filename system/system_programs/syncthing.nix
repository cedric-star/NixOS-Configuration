{config, pkgs, ...}:

{
  services.syncthing = {
    enable = disable;
    group = "cedric";
    user = "cedric";
  };

  # sudo systemctl start syncthing@cedric.service
  # http://localhost:8384/ für gui nach
}