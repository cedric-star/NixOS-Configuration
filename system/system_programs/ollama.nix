{ config, pkgs, ... }:

{
  services.ollama = {
    enable = true;
    loadModels = [ "llama3.2:1b" ];
  };
}
