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

(deprecated)
![neofetch](./other/images/Screenshot%20from%202026-03-02%2019-54-34.png)
![htop,cmatrix](./other/images/Screenshot%20from%202026-03-02%2019-53-38.png)
![fuzzel](./other/images/Screenshot%20from%202026-03-02%2020-02-08.png)
![overview 1](./other/images/Screenshot%20from%202026-03-02%2019-53-04.png)
![nvim](./other/images/Screenshot%20from%202026-03-02%2019-53-26.png)
![overview 2](./other/images/Screenshot%20from%202026-03-02%2019-56-30.png)

# Hindweise

- für skripte ausführen immer von ./scripts aus ausführen
- (außer cleanup script)
- niemals kommentare außer vorhandene in ./stylix/redpink.yaml!!!!!!!!! sonst
  crashout

- repo MUSS in /hoe/{user} liegen
- repo MUSS ordnernamen "NixOS-Configuration" haben
- mit uni wlan verbinden
  `nmcli connection add \
                        type wifi \
                        con-name "eduroam" \
                        ssid "eduroam" \
                        wifi-sec.key-mgmt wpa-eap \
                        802-1x.eap peap \
                        802-1x.phase2-auth mschapv2 \
                        802-1x.identity "u3***" \
                        802-1x.password "*****" \`

# nützlches

- https://mynixos.com/ oder
- https://rycee.gitlab.io/home-manager/options.xhtml
- nixos-rebuild switch --rollback
- wenn was wirklich schief läuft zurückgehen
- für ausführbare dateien:
- command am anfang: #!/...
- dann für pfad: command -v sh (anders unter nixos)

# updaten

- `sudo nix flake update` updated flake.lock datei
- `git add.`
- `git commit -m "flake-update"`
- `sudo nixos-rebuild switch --flake .#hp-buch` (oder nach # jeweiliger host)

# screensharing

- ´niri msg outputs´ --> eDP-1 oder HDMI-A-1
- `niri msg output DP-2 mode 1024x768@60.004` umd korekten modus zu setzen
- `wl-mirror --fullscreen-output fremdermonitorHDMI-1 eDP-1` --> startet
  screenshare
  - wichtig: nch -output in wl-mirror befehl: zuerst fremder monitor, dann
    eigener eDP-1 monitor
- `pkill wl-mirror` --> beendet sharing
- oder displays

# nicht deklarativ (nachinstallation nötig)

- pywalfox (bzw. alle firefox extensions), und einmalig `pywalfox install` in bash
- noctaliatheme vscode extension (damit theme aus home, nicht aus store
  ausgelesen wird)
- theming discord: vesktop -> theming -> noctalia material
- plugin: "auto dark" für jet brains ides (kein theming nur automatisch hell
  oder dunkel)
- steam millennium theming: https://steambrew.app/theme/ipYjqODds05KMcvh7QJn?id=ipYjqODds05KMcvh7QJn

# toto

- theming: spotify, steam
- yazi: kopieren, einfügen, rename
- eine app für regex dev
