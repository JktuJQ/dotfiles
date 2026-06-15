{ homeManagerModule, self, ... }:
rec {
    imports = [ homeManagerModule.nixosModules.home-manager ];
    
    my.user.name = "jktujq";
    my.user.homeDir = "/home/${my.user.name}";
    home-manager.users.${my.user.name} = { config, pkgs, ... }: {
        _module.args = {
            self = self;
            username = my.user.name;
            dotfilesDir = "${my.user.homeDir}/dotfiles";
        };

        imports = [
            # CLI
            (self + "/modules/home-manager/cli/coreutils.nix")
            (self + "/modules/home-manager/cli/git.nix")
            (self + "/modules/home-manager/cli/colors.nix")
            (self + "/modules/home-manager/cli/fastfetch.nix")

            # Shells
            (self + "/modules/home-manager/shells/starship.nix")
            (self + "/modules/home-manager/shells/bash.nix")
            (self + "/modules/home-manager/shells/fish.nix")

            # Terminals
            (self + "/modules/home-manager/terminals/alacritty.nix")

            # Editors
            (self + "/modules/home-manager/editors/nvim.nix")

            # Desktop
            (self + "/modules/home-manager/desktop/uwsm.nix")
            (self + "/modules/home-manager/desktop/hyprland.nix")

            # Browsers
            (self + "/modules/home-manager/browsers/firefox.nix")
        ];

        home.username = my.user.name;
        home.homeDirectory = my.user.homeDir;
        home.stateVersion = "26.05";
    };
}

