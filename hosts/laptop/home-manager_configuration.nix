{ homeManagerModule, self, pkgs, lib, ... }:
let
    allUsers = {
        jktujq = {
            systemSettings = {
                extraGroups = [ "wheel" "networkmanager" ];
            };
            homeSettings = {
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
                    (self + "/modules/home-manager/terminals/kitty.nix")
                    #(self + "/modules/home-manager/terminals/alacritty.nix")

                    # Editors
                    (self + "/modules/home-manager/editors/nvim.nix")

                    # Desktop
                    (self + "/modules/home-manager/desktop/xdg.nix")

                    (self + "/modules/home-manager/desktop/wayland/uwsm.nix")
                    (self + "/modules/home-manager/desktop/wayland/hyprland.nix")
                    (self + "/modules/home-manager/desktop/wayland/hyprshot.nix")
                    (self + "/modules/home-manager/desktop/wayland/waybar.nix")
                    (self + "/modules/home-manager/desktop/wayland/anyrun.nix")
                    (self + "/modules/home-manager/desktop/wayland/mako.nix")
                    (self + "/modules/home-manager/desktop/wayland/awww.nix")

                    # Browsers
                    (self + "/modules/home-manager/browsers/firefox.nix")
                ];
                home.sessionVariables = {
                    SHELL = lib.mkForce "fish";
                    # TERMINAL = "kitty";
                    # EDITOR = "nvim";
                    # BROWSER = "firefox";
                    # LAUNCHER = "anyrun"
                };
            };
        };
    };
in {
    imports = [ homeManagerModule.nixosModules.home-manager ];

    users.users = builtins.mapAttrs (name: cfg:
        {
            initialPassword = name;
            isNormalUser = true;
            home = "/home/${name}";
        } // cfg.systemSettings
    ) allUsers;

    home-manager.users = builtins.mapAttrs (name: cfg:
        lib.mkMerge [
            {
                _module.args = {
                    inherit self;
                };

                home = {
                    username = name;
                    homeDirectory = "/home/${name}";
                    stateVersion = "26.05";
                };
            }
            cfg.homeSettings
        ]
    ) allUsers;

    home-manager.backupFileExtension = "backup";
}
