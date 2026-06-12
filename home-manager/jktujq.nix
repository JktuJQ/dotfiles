{ config, pkgs, inputs, ... }:

{
    imports = [
        ../modules/home-manager/git.nix
        ../modules/home-manager/neovim.nix
        ../modules/home-manager/dev-packages.nix
        ../modules/home-manager/shell/fish.nix
        ../modules/home-manager/shell/starship.nix
        ../modules/home-manager/shell/fastfetch.nix
    ];

    home.username = "jktujq";
    home.homeDirectory = "/home/jktujq";
    home.stateVersion = "26.05";

    home.packages = with pkgs; [ ];
    home.file = { };
}
