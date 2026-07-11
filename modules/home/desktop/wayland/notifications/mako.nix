{ config, ... }:
let
  palette = config.lib.stylix.colors;
  fontName = config.stylix.fonts.monospace.name;
in
{
  services.mako = {
    enable = true;

    settings = {
      background-color = "#${palette.base00}";
      text-color = "#${palette.base05}";
      border-color = "#${palette.base0D}";
      progress-color = "over #${palette.base0A}";

      anchor = "top-right";
      layer = "overlay";

      width = 340;
      height = 140;
      margin = "10";
      padding = "12";
      border-size = 2;
      border-radius = 16;

      font = "${fontName} 12";
      icons = true;
      icon-path = "/usr/share/icons:/usr/share/pixmaps";
      max-icon-size = 48;

      default-timeout = 4000;
      ignore-timeout = false;
      actions = true;
      max-visible = 3;
      sort = "-time";
      group-by = "app-name";
      markup = true;

      "mode=do-not-disturb" = {
        invisible = 1;
      };
    };
  };

  stylix.targets.mako.enable = false;
}
