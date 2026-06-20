{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libnotify
  ];
  services.mako = {
    enable = true;
    settings = {
      anchor = "top-right";
      width = 320;
      height = 120;
      margin = "10";
      padding = "8";
      border-radius = 12;
      default-timeout = 3000;
      max-visible = 5;
      sort = "-time";
      group-by = "app-name";
      actions = true;
    };
  };
}
