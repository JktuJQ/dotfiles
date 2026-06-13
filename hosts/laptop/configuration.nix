{ config, pkgs, self, homeManagerModule, stylixModule, ... }:
rec {
    imports = [
        # Hardware configuration
        ./hardware_configuration.nix

        # NixOS common modules
        (self + "/modules/nixos/boot.nix")

        (self + "/modules/nixos/locale.nix")
        (self + "/modules/nixos/fonts.nix")

        (self + "/modules/nixos/user.nix")
        (self + "/modules/nixos/networking.nix")

        (self + "/modules/nixos/services/openssh.nix")
        (self + "/modules/nixos/services/dbus.nix")

        (self + "/modules/nixos/desktop/xdg.nix")
        (self + "/modules/nixos/desktop/hyprland.nix")

        # Nix packages
        homeManagerModule
        stylixModule
    ];

    my.user.name = "jktujq";
    my.user.homeDir = "/home/${my.user.name}";
    home-manager.users.${my.user.name} = { config, pkgs, ... }: {
        _module.args.dotfilesDir = "${my.user.homeDir}/dotfiles";

        imports = [
            # CLI
            (self + "/modules/home-manager/cli/coreutils.nix")
            (self + "/modules/home-manager/cli/git.nix")
            (self + "/modules/home-manager/cli/colors.nix")
            (self + "/modules/home-manager/cli/fastfetch.nix")

            # Shell
            (self + "/modules/home-manager/shell/starship.nix")
            (self + "/modules/home-manager/shell/bash.nix")
            (self + "/modules/home-manager/shell/fish.nix")

            # Editor
            (self + "/modules/home-manager/editor/nvim.nix")

            # Desktop
            (self + "/modules/home-manager/desktop/hyprland.nix")
        ];

        home.username = my.user.name;
        home.homeDirectory = my.user.homeDir;
        home.stateVersion = "26.05";
    };
    stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
        autoEnable = true;
    };

    system.stateVersion = "26.05";
}
