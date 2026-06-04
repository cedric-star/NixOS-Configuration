{ pkgs,inputs, ... }:

{
  programs.steam = {
    enable = false;
    gamescopeSession.enable = true; #gamescope %command% (in general -> launch optinions)
  };

  environment.systemPackages = [
    inputs.millennium.packages.x86_64-linux.millennium-steam
  ];
  programs.gamemode.enable = true; #gamemoderun %command% (in general -> launch optinions)


  environment.sessionVariables = {# für protonup: einmalig command "protonup" ins terminal
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/rot/compatibilitytools.d";
  };


}