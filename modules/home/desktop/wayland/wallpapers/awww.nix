{ config, pkgs, ... }:
{
  home.packages = with pkgs; [ awww ];
  systemd.user.services.awww-daemon = {
    Unit = {
      Description = "awww wallpaper daemon";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.awww}/bin/awww-daemon";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };

  systemd.user.services.awww-wallpaper = {
    Unit = {
      Description = "Set awww wallpaper";
      After = [ "awww-daemon.service" ];
      Wants = [ "awww-daemon.service" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.awww}/bin/awww img ${config.stylix.image} --transition-type any --transition-duration 2";
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
