{ self, config, pkgs, ... }:
{
    _module.args = {
        dotfilesDir = "${config.home.homeDirectory}/dotfiles";
    };

    imports = [
        (self + "/modules/home-manager/cli/coreutils.nix")
        (self + "/modules/home-manager/cli/git.nix")
        (self + "/modules/home-manager/cli/colors.nix")

        (self + "/modules/home-manager/shell/bash.nix")
        (self + "/modules/home-manager/shell/fish.nix")

        (self + "/modules/home-manager/editor/nvim.nix")

        (self + "/modules/home-manager/desktop/dconf.nix")
    ];

    home.username = "jktujq";
    home.homeDirectory = "/home/jktujq";
    home.stateVersion = "26.05";
}
