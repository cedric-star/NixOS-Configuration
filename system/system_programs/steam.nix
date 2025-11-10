{ pkgs, ... }:

{
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true; #gamescope %command% (in general -> launch optinions)
  programs.gamemode.enable = true; #gamemoderun %command% (in general -> launch optinions)
  

  environment.sessionVariables = {# für protonup: einmalig command "protonup" ins terminal
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/rot/compatibilitytools.d";
  }

}