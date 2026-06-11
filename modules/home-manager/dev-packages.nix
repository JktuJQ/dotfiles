{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        lua-language-server

        dwt1-shell-color-scripts
    ];
}
