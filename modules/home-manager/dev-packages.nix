{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        lua-language-server

        dwt1-shell-color-scripts
        bat
        eza
        fzf
        zoxide
        fd
        ripgrep
        fastfetch
        grc

        jetbrains-mono
        nerd-fonts.jetbrains-mono
    ];
}
