{config, pkgs, ...}:

{
  services.syncthing.enable = true;


  # sudo systemctl start syncthing@cedric.service
  # http://localhost:8384/ für gui nach
}