{ functions, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };

  xdg.configFile = functions.collectConfigFiles {
    path = ./hypr;
    prefix = "hypr";
  };
}
