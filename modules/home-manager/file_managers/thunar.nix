{ pkgs, ... }:
{
    home.packages = with pkgs; [ thunar ];

    home.sessionVariables.FILE_MANAGER = "thunar";
}
