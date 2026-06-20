{ pkgs, ... }:
{
  home.packages = with pkgs; [
    dwt1-shell-color-scripts
    rgrc
  ];
}
