{ functions, config, ... }:
let
  colors = config.lib.stylix.colors;
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false;
  };

  xdg.configFile = functions.collectConfigFiles {
    path = ./hypr;
    prefix = "hypr";
    extra = {
      "hypr/colors.lua".text = ''
        return {
          background = "#${colors.base00}",
          foreground = "#${colors.base05}",
          active = "#${colors.base0D}",
          inactive = "#${colors.base02}",
          urgent = "#${colors.base08}",
          surface = "#${colors.base01}",
        }
      '';
    };
  };

  stylix.targets.hyprland.enable = false;
}
