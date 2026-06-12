{ pkgs, ... }:
{
    fonts.fontconfig.enable = true;

    fonts.packages = with pkgs; [
        jetbrains-mono nerd-fonts.jetbrains-mono
    ];
}
