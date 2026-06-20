{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings.mainBar = {
      layer = "top";
      position = "top";
      height = 32;
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "clock" ];
      modules-right = [
        "network"
        "battery"
        "tray"
      ];

      "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
      };

      clock = {
        format = "{:%H:%M}";
        tooltip-format = "{:%A, %d %B %Y}";
      };

      network = {
        format-wifi = " {signalStrength}%";
        format-ethernet = " Connected";
        format-disconnected = " Offline";
      };

      battery = {
        format = "{capacity}%";
        format-charging = " {capacity}%";
        format-full = " {capacity}%";
        states = {
          warning = 30;
          critical = 15;
        };
      };

      tray = {
        spacing = 10;
      };
    };
  };
}
