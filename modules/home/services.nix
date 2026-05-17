{ pkgs, ... }:

{
  # ─── Autostart via systemd user units ────────────────────────────

  home.packages = [
    (pkgs.symlinkJoin {
      name = "gnome-control-center";
      paths = [ pkgs.gnome-control-center ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/gnome-control-center \
          --set XDG_CURRENT_DESKTOP GNOME
      '';
    })
  ];

  systemd.user.services.polkit-gnome = {
    Unit.Description = "GNOME Polkit Authentication Agent";
    Unit.After = [ "graphical-session.target" ];
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
    };
  };

  systemd.user.services.gnome-keyring = {
    Unit.Description = "GNOME Keyring Daemon";
    Unit.After = [ "graphical-session-pre.target" ];
    Install.WantedBy = [ "graphical-session-pre.target" ];
    Service = {
      ExecStart = "${pkgs.gnome-keyring}/bin/gnome-keyring-daemon --start --foreground --components=pkcs11,secrets,ssh";
      Restart = "on-failure";
    };
  };

  # GNOME Online Accounts Daemon
  systemd.user.services.goa-daemon = {
    Unit.Description = "GNOME Online Accounts Daemon";
    Unit.After = [ "graphical-session.target" ];
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      ExecStart = "${pkgs.gnome-online-accounts}/libexec/goa-daemon";
      Restart = "on-failure";
    };
  };

  # Evolution Data Server
  systemd.user.services.evolution-data-server = {
    Unit.Description = "Evolution Data Server";
    Unit.After = [ "graphical-session.target" ];
    Install.WantedBy = [ "graphical-session.target" ];
    Service = {
      ExecStart = "${pkgs.evolution-data-server}/libexec/evolution-data-server";
      Restart = "on-failure";
    };
  };

  # ─── XDG-Umgebungsvariablen (wichtig für Portale & Theming) ──────
  home.sessionVariables = {
    GNOME_KEYRING_CONTROL = "/run/user/1000/keyring";  # UID anpassen falls nötig
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
    XDG_CURRENT_DESKTOP = "GNOME";   # damit gnome-control-center & Portale korrekt arbeiten
    XDG_SESSION_TYPE = "wayland";
    DBUS_SESSION_BUS_ADDRESS = "unix:path=/run/user/1000/bus";
  };
}


