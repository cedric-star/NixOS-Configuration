# MyNixos Setup
(BasisThreadFrame580Dong)
## Customized Shit
- NiriWM
- GnomeDE
- kitty
- nvim
- styling with stylix
- waybar
- fuzzel
- noctalia
- nvim (extern)
- ...

## Screenshots
![neofetch](./other/images/Screenshot%20from%202026-03-02%2019-54-34.png)
![htop,cmatrix](./other/images/Screenshot%20from%202026-03-02%2019-53-38.png)
![fuzzel](./other/images/Screenshot%20from%202026-03-02%2020-02-08.png)
![overview 1](./other/images/Screenshot%20from%202026-03-02%2019-53-04.png)
![nvim](./other/images/Screenshot%20from%202026-03-02%2019-53-26.png)
![overview 2](./other/images/Screenshot%20from%202026-03-02%2019-56-30.png)

# Hindweise
- für skripte ausführen immer von ./scripts aus ausführen
- (außer cleanup script)
- niemals kommentare außer vorhandene in ./stylix/redpink.yaml!!!!!!!!! sonst crashout

# nützlches
- https://mynixos.com/ oder 
- https://rycee.gitlab.io/home-manager/options.xhtml
- nixos-rebuild switch --rollback
 - wenn was wirklich schief läuft zurückgehen
- für ausführbare dateien:
 - command am anfang: #!/...
 - dann für pfad: command -v sh (anders unter nixos)
 
# Rebuild Erklärung
- [A, B, C]
- A = fertig gebaut
- im Bau
- gesamtzahl zu bauen


# updaten
- `nix flake update ` updated flake.lock datei
- git add. 
- git commit -m "flake-update"
- system rebuild

# suche nach wort in config
- grep -r "xow_dongle" ./

# screensharing
- ´niri msg outputs´ --> eDP-1 oder HDMI-A-1 
- `niri msg output DP-2 mode 1024x768@60.004` umd korekten modus zu setzen
- `wl-mirror --fullscreen-output fremdermonitorHDMI-1 eDP-1` --> startet screenshare
    - wichtig: nch -output in wl-mirror befehl: zuerst fremder monitor, dann eigener eDP-1 monitor
- `pkill wl-mirror` --> beendet sharing
