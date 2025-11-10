{ pkgs, ... }:

{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true; #gamescope %command% (in general -> launch optinions)
  programs.gamemode.enable = true; #gamemoderun %command% (in general -> launch optinions)


}