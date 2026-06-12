{ pkgs, ... }:
{
    home.packages = with pkgs; [
        bat
        eza
        fzf
        zoxide
        fd
        ripgrep
    ];
}
